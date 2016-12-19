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
zplug "plugins/git", from:oh-my-zsh, nice:10
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
zplug load

# ================================
#       PLUGIN CONFIG
# ================================

# ZSH hilighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root)


# ================================
#       FUNCTIONS
# ================================

# myIP address
function myip {
	ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0 : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# Update zplug
function update_zplug {
	echo '———> Updating zplug...';
    zplug update --self
	echo '———> Updating zplug packages...';
	zplug update
}

function update_mac {
    update_zplug()
	echo '———> Running brew update...';
	brew update;
	echo '———> Running brew upgrade...';
	brew upgrade --all;
	echo '———> Running brew cleanup...';
	brew cleanup;
	echo '———> Running brew prune...';
	brew prune;
	echo '———> Running brew doctor...';
	brew doctor;
}

function update_ubuntu {
    update_zplug()
	echo '———> Running apt-get update...';
    sudo apt-get update;
	echo '———> Running apt-get dist-upgrade...';
    sudo apt-get dist-upgrade;
	echo '———> Cleaning unused packages with apt-get autoclean...';
    sudo apt-get autoclean;
	echo '———> Cleaning unused dependencies with apt-get autoremove...';
    sudo apt-get autoremove;
	echo '———> Checking with apt-get check...';
    sudo apt-get check;
}

# Create a new SSH key
function generate_ssh_key {
	ssh-keygen -t rsa -C "daniel.vidal.hussey@gmail.com" -f main_key;
	cat ~/.ssh/id_rsa.pub;
}

# mkdir & cd
# https://www.reddit.com/r/commandline/comments/2jl8t8/what_are_your_funniest_or_most_useful_alias_in/clcrp3e
function mkd {
    mkdir -p "$1" && cd "$1"
}

# ================================
#       ALIASES
# ================================

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

alias l='ls -lhoF ${colorflag}'		    # No hidden
alias ll='ls -lahoF ${colorflag}'	    # +Hidden
alias lls='ls -lahSoF ${colorflag}'	    # +Hidden +Sort by size
alias llt='ls -lahtoF ${colorflag}'	    # +Hidden +Sort by modified time

alias mailsize='du -hs ~/Library/mail'
alias ttop='top -ocpu -R -F -s 2 -n30'  # Top processes

alias cp='cp -i'                        # Don't silently overwrite

# Redefine ls commands using tree
alias t='tree -ACFh --du'	
alias l='t -L 1 -D -g --filelimit 500'
alias ll='l -a'
alias lls='ll --sort=size'

alias l2='l -L 2'
alias ll2='ll -L 2'

alias v='vim'
alias nv='nvim'
alias novim='vim -u NONE'
alias basicvim='vim -u ~/.basicvimrc'
alias simplevim='vim -u ~/.basicvimrc'
alias p='python'
alias p3='python3'
alias ip3='ipython3'
alias g='git'

alias h='history'

# Pretty print JSON
alias pjson='python -m json.tool'
alias pp='jq .'

alias please='sudo $(fc -ln -1)'        # http://unix.stackexchange.com/a/158480

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

# ================================
#       ENV
# ================================

# Preferred editor for local and remote sessions
export EDITOR='vim'

# For Python3 to print correctly
export PYTHONIOENCODING=utf-8

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
# TODO fix under ubuntu
#export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -"

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

# Substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# After vim Ctrl-Z to terminal, use Ctrl-Z again to enter vim
# Must be placed AFTER vim bindings to work properly
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# ================================
#       SHORTCUTS
# ================================

# NLP + Code
nlp=~/Documents/NLP
dotfiles=~/dotfiles

 
# Path required for Homebrew and Virtualenv
export PATH=/usr/local/bin:$PATH
export PATH=/Users/Dani/miniconda3/bin:$PATH

# For solarized-vim to work well on ubuntu
export TERM="xterm-256color"

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# TODO only for mac
# source /Users/Dani/.iterm2_shell_integration.zsh

#export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH"

# Set up docker to use the default boot2docker on OS X
#eval "$(docker-machine env default)"
