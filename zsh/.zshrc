# Load completion
autoload -Uz compinit
compinit

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Don't add commands that are prepended with a space to the history
setopt histignorespace

if [[ $(tty) == "/dev/tty"* ]] && [[ $(uname -s) != "Darwin" ]]; then
	PROMPT="[%n@%m %~]# "
else
	# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
	# Initialization code that may require console input (password prompts, [y/n]
	# confirmations, etc.) must go above this block; everything else may go below.
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
		source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	source ~/github/romkatv/powerlevel10k/powerlevel10k.zsh-theme

	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

export PATH="${HOME}/github/RC-14/scripts/:${HOME}/.local/bin/:${PATH}"

function fcd() {
	DIR=$(selectDir $@)

	# Return 1 if no directory was selected
	if [[ -z ${DIR} ]]; then
		return 1
	fi

	# Change to the selected directory
	cd "${DIR}"
	
	# Add the directory change to the history
	print -s cd "\"$(pwd)\""
}

function nf() {
	clear
	
	date "+%d.%m.%Y %H:%M:%S"
	
	# Show only minimal information to make neofetch faster
	neofetch --disable title model uptime packages resolution theme icons term gpu de wm wm_theme --color_blocks off

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
		# Remove the first argument [1, 2, 3] -> [2, 3]
		shift 1

		# Start mpv with the remaining arguments and the location
		mpv $@ $LOCATION
	else
		# Start mpv with the location
		mpv $LOCATION
	fi

	return $?
}

alias ls='ls --color=auto'
alias ll='ls -lh'
alias lsa='ls -A'
alias lla='ll -A'
alias grep='grep --colour=auto'
alias nv="nvim"
alias mpvVideodl="mpv ${HOME}/Downloads/videodl-*.mp4"

# Run the autosuggestion when Control and Space get pressed
bindkey '^ ' autosuggest-execute
# Run nf when Option/Alt and c get pressed
bindkey -s '^[c' '^unf\r'
# Run fcd when Option/Alt and space get pressed but prevent it from getting added to the history
bindkey -s '^[ ' '^u fcd\r'

# Source aliases specific to this device
[ -f "${HOME}/.aliases" ] && source "${HOME}/.aliases"
