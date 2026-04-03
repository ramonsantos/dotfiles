export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS="dir"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='027'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='027'

# Plugins
plugins=(
  git
  dnf
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Aliases
alias dnfu="sudo dnf update"
alias k="kubectl"
alias mkf='mkfile() { mkdir -p "$(dirname "$1")" && touch "$1"; }; mkfile'

# Configurations
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
