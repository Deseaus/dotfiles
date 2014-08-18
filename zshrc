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

 
export PATH=/usr/local/bin:$PATH
