#!/usr/bin/env bash

# This should be run from within arch-chroot.
# arch-chroot /mnt

systemctl enable NetworkManager

ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime
hwclock --systohc

nano /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

echo xps15 > /etc/hostname
cat <<"EOF" >> /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	xps15.localdomain	xps15
EOF

passwd

refind-install
nano /boot/refind_linux.conf
