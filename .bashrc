#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

###############################################################################
# Custom
###############################################################################

export PATH="${HOME}/git-repos/scripts/:${HOME}/.local/bin/:${PATH}"

function fcd() {
	DIR=$(selectDir $@)

	# Return 1 if no directory was selected
	if [[ -z ${DIR} ]]; then
		return 1
	fi

	# Change to the selected directory
	cd "${DIR}"
	
	# Print the current directory
	printf $(pwd) 

	# Add the directory change to the history
	history -s cd "\"$(pwd)\""
}

function nf() {
	clear
	
	# Show only minimal information to make neofetch faster
	neofetch --disable title model uptime packages resolution theme icons term gpu de wm wm_theme --color_blocks off

	# Return 0 if uname -s is Darwin
	if [[ $(uname -s) == "Darwin" ]]; then
		return 0
	fi

	# Check if we finished booting (systemd-analyze will fail if not)
	systemd-analyze time > /dev/null
	if [[ $? == 0 ]]; then
		# If we did, show the boot time
		systemd-analyze time
	else
		# If we didn't show jobs that are still running
		systemctl list-jobs
	fi

	return 0
}

# Start mpv pointing to the ~/Downloads directory
function mpvdl() {
	LOCATION="${HOME}/Downloads/"
	
	# If the first argument is set append it to the location
	if [[ -n $1 ]]; then
		LOCATION="${LOCATION}${1}"
	fi

	# If more arguments are set, use them as arguments to mpv
	if [[ -n $2 ]]; then
		# Remove the first argument (moves every argument one index to the left and removes the last one)
		shift 1

		# Start mpv with the remaining arguments and the location
		mpv $@ $LOCATION
	else
		# Start mpv with the location
		mpv $LOCATION
	fi

	return $?
}

alias c="clear"
alias nv="nvim"
alias lsd="ls ~/Downloads"
alias sl="sl; nf"

# Bind fcd to ALT+Space
bind -x '"\e ":"fcd && kill -INT $$")'
# Bind nf to ALT+C
bind -x '"\ec":"nf"'
