# ================================
#       ZSH CONFIG
# ================================

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

# History
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
export HISTSIZE=1000000 SAVEHIST=1000000 HISTFILE=~/.zhistory

# After vim Ctrl-Z, use Ctrl-Z again to enter vim
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi
