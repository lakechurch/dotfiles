# dotfiles
My collection of dotfiles

# Install
## Arch Linux
Current setup is with gnome display and arch linux. One step that is hugely 
helpful is to keep the root partition seperate from the home partition as this
allows the filesystem to be seperate from the OS and Apps.

### OS Setup Steps
1. Make LiveUSB
  $ wget https://latest-arch.iso  # Changes constantly so look up a mirror
  $ cp latest-arch.iso /dev/sdx   # This will wipe the USB so be smart
2. Boot from LiveUSB
3. Make partitions with fdisk
  Get drive /dev/
  # lsblk

  Create partitions
  # fdisk 
  /boot    1MB vfat (FAT32)
  /       20GB ext4
  /home 100+GB ext4
  zram for swap
4. Mount root and install base arch
5. Switch to root on mounted arch install
  Setup systemd-boot
  Setup fstab with /boot and /home mounts
  Setup user and sudo
6. Install Desktop enviroment 
  (Current choice xorg and gnome for support and simplicity)
  (Desired choice wayland and Hyprland but Nvidia :cry: )

### Applications
* Pacman Apps:
* AUR Apps: 

### SSH Setup
  $ cd ~
  $ mkdir .ssh
  make a key pair with the machine name <e.g. workdesk>
  populate .ssh/config with hosts and keys
  fwknock?

### Setup nextcloud and passwrd repo

### Dotfiles
From Application Install you should have git and gnu stow
  $ git checkout git@github.com:lakechurch/dotfiles.git ~/
  
  Assuming all parts are stable
  $ stow

  Otherwise
  $ stow zsh
