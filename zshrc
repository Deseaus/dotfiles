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

#zplug "robbyrussell/oh-my-zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh, nice:10
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh, nice:10
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))", nice:10
setopt prompt_subst
zplug "adambiggs/zsh-theme", use:adambiggs.z2h-theme
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
zplug load

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

# ================================
#       SHORTCUTS
# ================================

# NLP + Code
nlp=~/Documents/NLP
gfdir=~/Documents/NLP/GF
gflib=~/Documents/NLP/GF/lib/src
papers=~/Documents/NLP/Papers
moses=~/Documents/NLP/mosesdecoder

# Code
me=~/Documents/Me
dotfiles=~/dotfiles
projects=~/Documents/Projects

 
# Path required for Homebrew and Virtualenv
export PATH=/usr/local/bin:$PATH

# For solarized-vim to work well on ubuntu
export TERM="xterm-256color"

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# TODO only for mac
# source /Users/Dani/.iterm2_shell_integration.zsh

export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH"

# Set up docker to use the default boot2docker on OS X
#eval "$(docker-machine env default)"
