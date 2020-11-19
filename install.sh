# Install needed apps

########## Install
apt install exa
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
##########

########## Git Submodule(s)
echo "Initializing submodules"
git submodule update --init --recursive
##########

