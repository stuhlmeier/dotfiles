sudo -v

# Plank autostart
mkdir -p ~/.config/autostart
cat <<"EOF" > ~/.config/autostart/plank.desktop
[Desktop Entry]
Name=Plank
Exec=plank
Type=Application
X-GNOME-Autostart-enabled=true
EOF

# GNOME settings
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

yay -S numix-circle-icon-theme-git numix-circle-arc-icons-git capitaine-cursors || exit
yay -S ttf-windows || exit
wget https://github.com/EliverLara/Sweet/releases/latest/download/Sweet-Dark.zip
unzip -q Sweet-Dark.zip -d ~/.themes

gsettings set org.gnome.desktop.interface gtk-theme Sweet-Dark
gsettings set org.gnome.desktop.wm.preferences theme Sweet-Dark
gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors
gsettings set org.gnome.desktop.interface cursor-size 32
gsettings set org.gnome.desktop.interface icon-theme Numix-Circle-Arc
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Segoe UI 11"
gsettings set org.gnome.desktop.interface font-name "Segoe UI 11"
gsettings set org.gnome.desktop.interface font-name "Fira Code weight=450 10"

gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true

gsettings set org.gnome.nautilus.preferences default-folder-viewer list-view
gsettings set org.gnome.nautilus.list-view default-zoom-level small
gsettings set org.gnome.nautilus.icon-view default-zoom-level small

gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor scheme builder-dark

gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Configure pacman colors :)
sudo sed -i "s/#Color/Color/" /etc/pacman.conf

# IBus (Japanese input)
sudo pacman -S ibus ibus-anthy

cat <<"EOF" >> ~/.xprofile
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
EOF

# Set up projects
mkdir -p /data/Projects || exit
pushd /data/Projects || exit

git clone git@github.com:stuhlmeier/stuhlmeier.github.io.git
git clone git@github.com:stuhlmeier/memistry.git
git clone git@github.com:stuhlmeier/melange.git
git clone git@github.com:stuhlmeier/gdpr.git
git clone git@github.com:stuhlmeier/kotlin-events.git
git clone git@github.com:stuhlmeier/android-minesweeper.git

popd || exit

# Set shell
chsh -s "$(command -v fish)"
