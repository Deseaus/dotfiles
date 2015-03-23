#  
#  ███████╗███████╗██╗  ██╗
#  ╚══███╔╝██╔════╝██║  ██║
#    ███╔╝ ███████╗███████║
#   ███╔╝  ╚════██║██╔══██║
#  ███████╗███████║██║  ██║
#  ╚══════╝╚══════╝╚═╝  ╚═╝
#                          
#  ██████╗ ██╗   ██╗
#  ██╔══██╗╚██╗ ██╔╝
#  ██████╔╝ ╚████╔╝ 
#  ██╔══██╗  ╚██╔╝  
#  ██████╔╝   ██║   
#  ╚═════╝    ╚═╝   
#                   
#  ██████╗ ███████╗███████╗███████╗ █████╗ ██╗   ██╗███████╗
#  ██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝
#  ██║  ██║█████╗  ███████╗█████╗  ███████║██║   ██║███████╗
#  ██║  ██║██╔══╝  ╚════██║██╔══╝  ██╔══██║██║   ██║╚════██║
#  ██████╔╝███████╗███████║███████╗██║  ██║╚██████╔╝███████║
#  ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
                                                         
# ================================
#       ZSH CONFIG
# ================================

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/
source /usr/local/bin/virtualenvwrapper.sh

# For Python3 to print correctly
export PYTHONIOENCODING=utf-8

# CD without typing cd
setopt AUTO_CD

# Always work like pushd
# "cd -" will take you to the last directory
# http://gimbo.org.uk/blog/2007/02/23/autopushd_in_zsh/
setopt AUTO_PUSHD 
setopt PUSHD_IGNORE_DUPS

# Use vim to view man pages
# http://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/
export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -"

# ================================
#       HISTORY
# ================================

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
export HISTSIZE=1000000 SAVEHIST=1000000 HISTFILE=~/.zhistory

# ================================
#       KEY BINDINGS
# ================================

# vi bindings!
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# After vim Ctrl-Z to terminal, use Ctrl-Z again to enter vim
# Must be placed AFTER vim bindings to work properly
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi
