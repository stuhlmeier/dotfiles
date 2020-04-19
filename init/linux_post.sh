#!/usr/bin/env bash

useradd -m -g users -G wheel stuhlmeier
usermod -c Moira stuhlmeier
passwd stuhlmeier

export EDITOR=nano
visudo
