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

source "$HOME/dotfiles/antigen/antigen.zsh"

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

# Path to Haskell binaries
#export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$PATH:/Users/Dani/Library/Haskell/bin
export GF_LIB_PATH=/Users/Dani/Library/Haskell/ghc-7.8.4/lib/gf-3.6.10/share/lib
