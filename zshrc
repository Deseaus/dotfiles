# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
#
# Daniel Vidal Hussey
# https://github.com/Deseaus/dotfiles

# ================================
#       FPATH SELF-HEAL
# ================================

# A shell/tmux server started before a Homebrew package (e.g. zsh itself) gets
# upgraded can hand a stale FPATH down to every child it spawns afterwards (new
# terminal tabs, new tmux panes), even though the upgrade is already fixed on
# disk. Drop any fpath entries that no longer exist, re-add the current zsh
# functions dir (compinit/add-zsh-hook/etc live there), and dedupe -- so every
# fresh shell self-corrects instead of inheriting the staleness.
typeset -U fpath
fpath=(${^fpath}(N-/))
if type brew &>/dev/null; then
    zsh_functions_dir="$(brew --prefix zsh)/share/zsh/functions"
    [[ -d $zsh_functions_dir ]] && fpath=($zsh_functions_dir $fpath)
    unset zsh_functions_dir
fi

# ================================
#       ANTIDOTE CONFIG
# ================================

# Install antidote if missing
if [[ ! -d ${ZDOTDIR:-$HOME}/.antidote ]]; then
    echo "Antidote is not installed. Installing..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
fi

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
setopt prompt_subst


# ================================
#       PLUGIN CONFIG
# ================================
# NOTE: these must be set BEFORE the plugin bundle is sourced below - several
# plugins (zsh-syntax-highlighting, zsh-autosuggestions) only apply these
# settings once, at source time.

# ZSH hilighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root)

# bullet-train calls git_prompt_info/git_prompt_status synchronously via eval
# (not through a literal $(git_prompt_info) in $PROMPT), so oh-my-zsh never
# detects it needs to register its async git-prompt handler and the segment
# renders empty forever. Force the old synchronous codepath instead.
zstyle ':omz:alpha:lib:git' async-prompt no

BULLETTRAIN_PROMPT_ORDER=(
     time
     status
     custom
     context
     dir
     #virtualenv
     git
     cmd_exec_time
)

# Load and configure autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8C8888,underline"

# Several oh-my-zsh plugins (docker, kubectl, ...) cache completions here;
# normally set by oh-my-zsh's own core, which we don't load standalone.
export ZSH_CACHE_DIR=${ZDOTDIR:-$HOME}/.cache/oh-my-zsh
mkdir -p "$ZSH_CACHE_DIR/completions"


# ================================
#       PLUGIN LOAD
# ================================
# Antidote compiles each plugin list into a static, fast-loading bundle.
# Regenerate a bundle whenever its .txt source changes.
#
# Loading happens in three stages because compinit has to sit in the middle:
# zsh-completions only adds to $fpath (compinit needs to see it), while the
# oh-my-zsh plugins below call `compdef` directly at source time (which only
# exists once compinit has run).

zsh_plugins_pre=${ZDOTDIR:-$HOME}/.zsh_plugins_pre
if [[ ! ${zsh_plugins_pre}.zsh -nt ${zsh_plugins_pre}.txt ]]; then
    antidote bundle <${zsh_plugins_pre}.txt >${zsh_plugins_pre}.zsh
fi
source ${zsh_plugins_pre}.zsh

# Cache the completion dump and only rebuild it once a day.
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
fi
source ${zsh_plugins}.zsh


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

# Update antidote plugins
function update_antidote {
    echo '⬇️ ⏳ Updating antidote plugins...'
	antidote update
	antidote bundle <${ZDOTDIR:-$HOME}/.zsh_plugins_pre.txt >${ZDOTDIR:-$HOME}/.zsh_plugins_pre.zsh
	antidote bundle <${ZDOTDIR:-$HOME}/.zsh_plugins.txt >${ZDOTDIR:-$HOME}/.zsh_plugins.zsh
    echo '✅ Done!'
}

function update_mac {
    update_antidote
    echo '⬇️ ⏳ Updating tmux plugins...'
    ~/.tmux/plugins/tpm/bin/update_plugins all
    echo '✅ Done!'
	echo '⬇️ ⏳ Running brew update...';
	brew update;
    echo '✅ Done!'
	echo '⬇️ ⏳ Running brew upgrade...';
	brew upgrade;
    echo '✅ Done!'
	echo '⬇️ ⏳ Running brew cleanup...';
	brew cleanup;
    echo '✅ Done!'
	echo '⬇️ ⏳ Running brew prune...';
	brew prune;
    echo '✅ Done!'
	echo '⬇️ ⏳ Running brew doctor...';
	brew doctor;
    echo '✅ Done!'
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
#      ZSH
# ================================


# ================================
#      THEME
# ================================

# Detect which `ls` flavor is in use
# https://github.com/mathiasbynens/dotfiles/
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Colour theme for ZSH completions 
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Solarized-like colours for the BSD version of ls included in OSX
# https://github.com/seebi/dircolors-solarized/issues/10
# Consider installing GNU versions of tools: brew install coreutils
# http://tealscientific.com/blog/?p=2450
export LS_COLORS=gxfxbEaEBxxEhEhBaDaCaD


# ================================
#       ALIASES
# ================================

alias llt='ls -lahtoF ${colorflag}'	    # +Hidden +Sort by modified time

alias mailsize='du -hs ~/Library/mail'

alias cp='cp -i'                        # Don't silently overwrite

# ls commands using tree
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
alias pp='jq .'

alias please='sudo $(fc -ln -1)'        # http://unix.stackexchange.com/a/158480

# Dotfile configuration
alias my-zsh="vim ~/.zshrc"
alias my-vimrc='vim ~/.vimrc'

# Suffix aliases
alias -s py=vim
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

dotfiles=~/dotfiles

# For solarized-vim to work well on ubuntu
export TERM="xterm-256color"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ================================
#       HOMEBREW
# ================================

# PATH now set in ~/.zprofile (this file is evaled once at system startup, not every
# time a shell is launched).
export PATH="/opt/homebrew/bin:$PATH"

# Created by `pipx` on 2024-11-12 14:29:26
export PATH="$PATH:/Users/Dani/.local/bin"
export PATH="/opt/homebrew/sbin:$PATH"
