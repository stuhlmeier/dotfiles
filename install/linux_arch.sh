#!/usr/bin/env bash

source linux.sh

use_yay=true
installed_yay=false

if [ "$use_yay" = true ] && ! [ -x "$(command -v yay)" ]; then
  echo "Installing yay"
  git clone https://aur.archlinux.org/yay.git
  pushd yay || exit
  makepkg -si
  popd || exit
  installed_yay=true
fi

function install() {
    sudo pacman -S --noconfirm "$@"
}

function install_aur() {
  if [ "$use_yay" = true ]; then
    yay -S "$@"
  fi
}

pacman_packages=(
  # System
  #

  # Desktop
  gdm gnome gnome-extra gnome-tweaks
  chrome-gnome-shell
  plank tilix

  firefox-developer-edition
  blender
  gimp darktable
  vlc lmms
  speedcrunch

  # steam
  # minecraft

  emacs gedit libreoffice notepadqq texstudio

  # Tools
  docker
  mc
  ffmpeg
  virtualbox
  samba
  cloc wget
  nmap
  htop neofetch

  # Build
  clang llvm lldb valgrind
  cmake meson
  gradle maven
  # jdk-openjdk
  texlive-most
  npm
  git mercurial
)

aur_packages=(
  jdk-adoptopenjdk

  ttf-twemoji-color adobe-source-han-sans-otc-fonts
  ttf-fira-code ttf-cascadia-code

  gnome-shell-extension-blyr

  jetbrains-toolbox libgnome-keyring
  vscodium-bin

  teams
  discord-canary
)

# Enable multilib
block=$(pcregrep -Mn "#\[multilib\](\n#.+)+" /etc/pacman.conf)
start=$(echo "$block" | head -n 1 | cut -d : -f 1)
lc=$(echo "$block" | wc -l)

sudo sed -i "$start,$((start + lc - 1)) s/^#//" /etc/pacman.conf

# Install packages
install "${pacman_packages[@]}" || exit
install_aur "${aur_packages[@]}" || exit

sudo systemctl enable gdm
sudo systemctl enable docker

if [ "$installed_yay" = true ]; then
  rm -rf yay
fi

echo "Reboot to start GDM, or start it now with \`systemctl start gdm\`."
