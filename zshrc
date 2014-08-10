# ================================
#       ANTIGEN CONFIG
# ================================

source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES

    git
    python
    pip
    github
    brew
    osx
    extract
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-completions src

EOBUNDLES

# Use the Bullet Train theme
antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# ================================
#       PLUGIN CONFIG
# ================================

# ZSH hilighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/
source /usr/local/bin/virtualenvwrapper.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'


antigen apply

# ================================
#       ZSH CONFIG
# ================================

setopt AUTO_CD

# History
export HISTSIZE=1000000 SAVEHIST=1000000 HISTFILE=~/.zhistory

HIST_STAMPS="dd.mm.yyyy"

# ================================
#       PERSONAL CONFIG
# ================================

source "$HOME/dotfiles/custom/deseaus.zsh"
