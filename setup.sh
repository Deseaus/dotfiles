# Original script from https://github.com/aharris88/dotfiles
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

# List of files/folders to symlink in homedir
files="gitconfig gitignore antigen vim vimrc nvim nvimrc zshrc"

# Create dotfiles_old in homedir
echo "Install dotfiles"
echo "================"
echo " "
echo "1. Creating $olddir to backup any existing dotfiles in ~ ..."
mkdir -p $olddir

# Change to the dotfiles directory
echo "2. Changing to the $dir directory..."
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "3. Installing..."
for file in $files; do
    echo " "
    echo "Moving $file from ~ to $olddir ..."
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory..."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh:)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script."
        exit
    fi
fi
}

# TODO get this function working properly
#install_zsh
