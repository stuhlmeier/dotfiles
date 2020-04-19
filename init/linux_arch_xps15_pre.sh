#!/usr/bin/env bash

# Create filesystems
mkfs.ext4 -L arch /dev/nvme0n1p6
mkswap -L swap /dev/nvme0n1p5

# Mount partitions
swapon /dev/nvme0n1p5

mkdir /mnt
mount /dev/nvme0n1p6 /mnt

mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot

nano /etc/pacman.d/mirrorlist

source linux_arch_pre.sh
