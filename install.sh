#!/bin/sh

# Upgrade packages
sudo dnf upgrade

# Set real time clock to UTC
sudo timedatectl set-local-rtc 0

# Set default shell to fish
chsh -s /bin/fish

# Multimedia - https://rpmfusion.org/Howto/Multimedia
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf update @core
sudo dnf install rpmfusion-\*-appstream-data

# AMD Drivers
sudo dnf install mesa-va-drivers-freeworld mesa-va-drivers-freeworld.i686

# Firmware Updates
fwupdmgr refresh --force
fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update

# Flathub Repository
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Packages
sudo dnf install \
cascadia-code-nf-fonts \
dust \
eza \
fastfetch \
fish \
gh \
gnome-tweaks \
gnucash \
libreoffice \
micro \
podman podman-compose \
qalculate-gtk \
rclone

# Flatpaks
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub io.github.pol_rivero.github-desktop-plus
flatpak install flathub io.podman_desktop.PodmanDesktop

# LibreOffice Start Center Icon
desktop-file-install \
    --dir=${HOME}/.local/share/applications \
    --remove-key=NoDisplay \
    /usr/share/applications/libreoffice-startcenter.desktop

# Rclone - remove 'NOTICE: Config file "/home/john/.config/rclone/rclone.conf" not found - using defaults'
rclone config touch

# Gnome desktop settings
# Appearance > Style = Dark
# Mouse & Touchpad > Mouse > Pointer Speed = Fast
# Mouse & Touchpad > Mouse > Mouse Acceleration = OFF
# Tweaks > Windows > Titlebar Buttons > All ON
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.peripherals.mouse speed 1.0
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

