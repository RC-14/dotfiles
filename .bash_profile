clear

# brew - Add brew paths to ${PATH} ?
eval "$(/opt/homebrew/bin/brew shellenv)"

# Source bash-completion if available
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Add llvm to $PATH if "/opt/homebrew/opt/llvm/bin/" is a directory
if [[ -d "/opt/homebrew/opt/llvm/bin/" ]]; then
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi

# Add node@16 to $PATH if "/opt/homebrew/opt/node@16/bin" is a directory
if [[ -d "/opt/homebrew/opt/node@16/bin" ]]; then
	export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
fi

# iTerm 2 - Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# MacOS - Disable bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# If ~/.bashrc exists source it
test -e "${HOME}/.bashrc" && source "${HOME}/.bashrc"
