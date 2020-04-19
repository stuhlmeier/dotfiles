# dotfiles

This repository contains my configuration files, as well as some setup scripts.

I currently only use this on a Dell XPS 15 9560.

Obviously, I do not intend to ensure compatibility as these are intended for personal use, but if you find this and are using similar hardware, the Arch setup scripts _should_ probably work.

## `/init`

Includes installation scripts for Arch Linux.

When installing Arch, the `_pre`/`_post` scripts must be run before/after `chroot`ing into the new system.
The `_chroot` scripts should be run while `chroot`ed.

## `/install`

The install scripts should be run in a functional system (i.e. not from a live USB.). They assume that the logged-in user has `sudo` rights.

## `/setup`

The setup scripts apply certain tweaks such as auto-start scripts, theming, and login shells.

## Extra steps

Some steps can't be automated, so you'll have to do them manually:

- [Fixing dual-boot Bluetooth pairing](https://unix.stackexchange.com/questions/255509/bluetooth-pairing-on-dual-boot-of-windows-linux-mint-ubuntu-stop-having-to-p)
- Turn off [fast startup](https://superuser.com/questions/1152001/shutdown-windows-10-truly-for-a-dual-booting-system)
