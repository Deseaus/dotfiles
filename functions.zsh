# 
# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
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
	brew upgrade --all;
	echo '———> Running brew cleanup...';
	brew cleanup;
	echo '———> Running brew prune...';
	brew prune;
	echo '———> Running brew doctor...';
	brew doctor;
}

# Update antigen and homebrew
function update_ubuntu {
	echo '———> Updating antigen...';
	antigen selfupdate;
	echo '———> Updating antigen packages...';
	antigen update;
	echo '———> Cleaning antigen local packages...';
	antigen cleanup;
	echo '———> Upgrading apt-get...';
    sudo apt-get upgrade;
	echo '———> Updating apt-get...';
    sudo apt-get update;
}
# Create a new SSH key
function generate_ssh_key {
	ssh-keygen -t rsa;
	cat ~/.ssh/id_rsa.pub;
}

# mkdir & cd
# https://www.reddit.com/r/commandline/comments/2jl8t8/what_are_your_funniest_or_most_useful_alias_in/clcrp3e
function mkd {
    mkdir -p "$1" && cd "$1"
}
