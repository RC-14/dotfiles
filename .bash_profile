clear

# MacOS - Disable bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# brew - Add brew paths to ${PATH} ?
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# Source bash-completion if available
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# If ~/.bashrc exists source it
test -e "${HOME}/.bashrc" && source "${HOME}/.bashrc"
