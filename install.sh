# Install needed apps

## First determine Linux OS
if grep -q ID=ubuntu "/etc/os-release"; then
  ########## Install
  apt install exa
  bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
  ##########

  ########## Plug.vim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ##########
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  apt install nodejs

  ########## Install zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if grep -q ID=arch "/etc/os-release"; then
  sudo pacman -S exa --needed --noconfirm
  sudo pacman -S llvm --needed --noconfirm
  ########## Plug.vim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ##########
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


  ########## Install zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

########## Git Submodule(s)
echo "Initializing submodules"
git submodule update --init --recursive
##########
