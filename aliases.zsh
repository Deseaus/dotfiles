# 
#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#                                                    
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
                                                         
# ******************
# CUSTOM ALIASES
# ******************

alias l='ls -lhoF'					        # No hidden
alias ll='ls -lahoF'				        # +Hidden
alias lls='ls -lahSoF'				        # +Hidden Sort by size

alias mailsize='du -hs ~/Library/mail'
alias ttop='top -ocpu -R -F -s 2 -n30'		# Top processes

alias tree='tree -AC'	                    # Print pretty lines colourise
alias cp='cp -i'                            # Don't silently overwrite

alias v='vim'
alias p='python'
alias p3='python3'
alias ip3="ipython3"

alias please='sudo $(fc -ln -1)'            # http://unix.stackexchange.com/a/158480

# Dotfile configuration
alias my-zsh="vim ~/.zshrc"
alias my-vimrc='vim ~/.vimrc'
alias my-aliases='vim ~/dotfiles/aliases.zsh'
alias my-general='vim ~/dotfiles/general.zsh'
alias my-functions='vim ~/dotfiles/functions.zsh'
alias my-shortcuts='vim ~/dotfiles/shortcuts.zsh'

# Suffix aliases
alias -s py=vim
alias -s gf=vim
alias -s md=vim
alias -s markdown=vim
alias -s css=vim
alias -s js=vim

