# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
#                         
# ██████╗ ██╗   ██╗
# ██╔══██╗╚██╗ ██╔╝
# ██████╔╝ ╚████╔╝ 
# ██╔══██╗  ╚██╔╝  
# ██████╔╝   ██║   
# ╚═════╝    ╚═╝   
#                  
# ██████╗ ███████╗███████╗███████╗ █████╗ ██╗   ██╗███████╗
# ██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝
# ██║  ██║█████╗  ███████╗█████╗  ███████║██║   ██║███████╗
# ██║  ██║██╔══╝  ╚════██║██╔══╝  ██╔══██║██║   ██║╚════██║
# ██████╔╝███████╗███████║███████╗██║  ██║╚██████╔╝███████║
# ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
#
# Daniel Vidal Hussey
# http://dvh.io
# http://github.io/Deseaus/dotfiles
                                                         
# ================================
#       ANTIGEN CONFIG
# ================================

# TODO needs to be changed every time the dotfiles are cloned to a new machine.
source "$HOME/dotfiles/antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES

    python
    pip
    github
    brew
    osx
    extract
    zsh-users/zsh-completions src
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting

EOBUNDLES

# Use the Bullet Train theme
antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# ================================
#       PLUGIN CONFIG
# ================================

# ZSH hilighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root)

antigen apply


# ================================
#       PERSONAL CONFIG
# ================================

source "$HOME/dotfiles/aliases.zsh"
source "$HOME/dotfiles/general.zsh"
source "$HOME/dotfiles/functions.zsh"
source "$HOME/dotfiles/shortcuts.zsh"

 
# Path required for Homebrew and Virtualenv
export PATH=/usr/local/bin:$PATH

# For solarized-vim to work well on ubuntu
export TERM='xterm-256color'

# Path to Haskell binaries
export PATH=$PATH:/Users/Dani/Library/Haskell/bin
export GF_LIB_PATH=/Users/Dani/Library/Haskell/ghc-7.10.2/lib/gf-3.7/share/lib
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# TODO only for mac
# source /Users/Dani/.iterm2_shell_integration.zsh

# Autoenv functionality
source ~/.autoenv/activate.sh
