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

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

zplug "robbyrussell/oh-my-zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
setopt prompt_subst
zplug "adambiggs/zsh-theme", use:adambiggs.zsh-theme
zplug "caiogondim/bullet-train-oh-my-zsh-theme"

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Then, source packages and add commands to $PATH
zplug load --verbose

# ================================
#       PLUGIN CONFIG
# ================================

# ZSH hilighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root)



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
export TERM="xterm-256color"

# Path to Haskell binaries
#export PATH=$PATH:/Users/Dani/Library/Haskell/bin
#export GF_LIB_PATH=/Users/Dani/Library/Haskell/ghc-7.10.2/lib/gf-3.7/share/lib
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# TODO only for mac
# source /Users/Dani/.iterm2_shell_integration.zsh

# Autoenv functionality
#source ~/.autoenv/activate.sh

#export PATH="/home/daniel/miniconda2/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH"
## Pyenv
#export PATH="/home/daniel/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# Set up docker to use the default boot2docker on OS X
#eval "$(docker-machine env default)"
