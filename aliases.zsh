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

# Detect which `ls` flavor is in use
# FIXME not working in zsh?
# https://github.com/mathiasbynens/dotfiles/
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Colour theme for ZSH completions 
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Solarized-like colours for the BSD version of ls included in OSX
# https://github.com/seebi/dircolors-solarized/issues/10
# Consider installing GNU versions of tools: brew install coreutils
# http://tealscientific.com/blog/?p=2450
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

alias l='ls -lhoF ${colorflag}'					        # No hidden
alias ll='ls -lahoF ${colorflag}'				        # +Hidden
alias lls='ls -lahSoF ${colorflag}'				        # +Hidden +Sort by size
alias llt='ls -lahtoF ${colorflag}'				        # +Hidden +Sort by modified time

alias llist='ls -m'                     # List files in a comma-separated line
alias lllist='ls -ma'                   # List all files in a comma-separated line

alias mailsize='du -hs ~/Library/mail'
alias ttop='top -ocpu -R -F -s 2 -n30'		# Top processes

alias tree='tree -AC'	                    # Print pretty lines colourise
alias cp='cp -i'                            # Don't silently overwrite

alias v='vim'
alias nv='nvim'
alias p='python'
alias p3='python3'
alias ip3="ipython3"

alias h='history'


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
alias -s html=vim
alias -s json=vim

