# Install needed apps

########## Install
apt install exa
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
##########

########## Git Submodule(s)
echo "Initializing submodules"
git submodule update --init --recursive
##########

########## Plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
##########
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

apt install nodejs
