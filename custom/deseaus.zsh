# ******************
# PROJECT SHORTCUTS
# ******************

gftranslate="/Users/Dani/Documents/MLT/6-Computational-Syntax/GF/lib/src/translator/todo"


# ******************
# CUSTOM ALIASES
# ******************

alias l='ls -lhoF'					# No hidden
alias ll='ls -lahoF'				# +Hidden
alias lls='ls -lahSoF'				# +Hidden Sort by size
alias lh='ls -laoF | egrep "^\."'	# Only hidden

alias mailsize='du -hs ~/Library/mail'
alias ttop='top -ocpu -R -F -s 2 -n30'		# Top processes

alias tree='tree -AC'	            # Print pretty lines and always colourise
alias cp='cp -i'                    # Don't silently overwrite

# Dotfile configuration
 
alias my-zsh="vim ~/.zshrc"
alias my-vimrc='vim ~/.vimrc'
alias my-customrc='vim ~/dotfiles/custom/deseaus.zsh'

# Suffix aliases

alias -s py=vim
alias -s gf=vim
alias -s md=vim

# ******************
# CUSTOM FUNCTIONS
# ******************

# foo() {command ; command ;}
# function foo {
#     command
#   }

# Turn hidden files on/off in Finder
function finder_show_hidden { defaults write com.apple.finder AppleShowAllFiles YES ; }
function finder_hide_hidden { defaults write com.apple.finder AppleShowAllFiles NO ; }

# View man pages in Preview
function pmanm { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }

# myIP address
function myip {
	ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0 : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# Update antigen and homebrew
function update_stuff {
	echo '———> Updating antigen...';
	antigen selfupdate;
	echo '———> Updating antigen packages...';
	antigen update;
	echo '———> Cleaning antigen local packages...';
	antigen cleanup;
	echo '———> Running brew update...';
	brew update;
	echo '———> Running brew upgrade...';
	brew upgrade;
	echo '———> Running brew cleanup...';
	brew cleanup;
	echo '———> Running brew prune...';
	brew prune;
	echo '———> Running brew doctor...';
	brew doctor;
}

# Create a new SSH key
function generate_ssh_key {
	ssh-keygen -t rsa;
	cat ~/.ssh/id_rsa.pub;
}
