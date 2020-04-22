#!/usr/bin/env bash
# This assumes partitions have already been made and mounted.

pacstrap_packages=(
  linux linux-firmware linux-headers
  base base-devel git
  man-db man-pages texinfo
  vi vim nano
  fish
  networkmanager
  iw
  # netctl dialog

  refind
  inetutils
  exfat-utils ntfs-3g
)

timedatectl set-ntp true
pacstrap /mnt "${pacstrap_packages[@]}"

genfstab -U /mnt >> /mnt/etc/fstab
