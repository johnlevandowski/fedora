Fedora Installation
===================

* [Fedora Workstation 44](https://fedoraproject.org/workstation/download/)
* Installation Method = Use entire disk
* Enable third-party repositories

```
sudo dnf update
sudo timedatectl set-local-rtc 0
git clone https://github.com/johnlevandowski/fedora $HOME/Documents/GitHub/fedora
```


Multimedia
----------

https://rpmfusion.org/Howto/Multimedia

```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
```

```
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf update @core
sudo dnf install rpmfusion-\*-appstream-data
```

```
sudo dnf install mesa-va-drivers-freeworld
sudo dnf install mesa-va-drivers-freeworld.i686
```


Firmware Updates
----------------

```
fwupdmgr refresh --force
fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update
```


Samba Mounts
------------

```
sudo cp $HOME/Documents/GitHub/fedora/files/etc/samba/.smbcredentials /etc/samba/
sudo micro /etc/samba/.smbcredentials

```

```
sudo chmod 600 /etc/samba/.smbcredentials
sudo mkdir -p /mnt/rpi5

sudo cp $HOME/Documents/GitHub/fedora/files/etc/systemd/system/mnt-rpi5.mount /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now mnt-rpi5.mount
sudo chown -R $USER:$USER /mnt/rpi5

```


Flathub Repository
------------------

```
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```


AppImage Support (if needed)
----------------------------

```
sudo dnf install fuse-libs
flatpak install flathub it.mijorus.gearlever
```


Applications
------------

```
sudo dnf install \
alacritty \
cascadia-code-nf-fonts \
dust \
eza \
fastfetch \
fish \
gh \
gnucash \
micro \
rclone
```

```
flatpak install flathub io.github.pol_rivero.github-desktop-plus
```


Games
-----

```
sudo dnf install steam
```

The first time you run Steam, it will update itself to the latest version.  This process can take some time.  

```
sudo dnf -y copr enable faugus/faugus-launcher
sudo dnf -y install faugus-launcher
```


Settings
--------

* Displays
* Power > Performance
* Appearance > Style > Dark
* Mouse & Touchpad > Mouse > Pointer Speed = Fast
* Mouse & Touchpad > Mouse > Mouse Acceleration = OFF
* System > About > Device Name = fedora-b850

https://github.com/johnlevandowski/dotfiles#restore-dotfiles-from-git-repository  


Gnome Tweaks and Extensions
---------------------------

```
sudo dnf install gnome-tweaks
flatpak install flathub com.mattjakeman.ExtensionManager
```

* Tweaks > Windows > Maximize = ON
* Tweaks > Windows > Minimize = ON
* Extension Manager > Installed > Background Logo = OFF
* Extension Manager > Browse
  * AppIndicator and KStatusNotifierItem Support
  * ArcMenu
  * Dash to Panel
  * Tiling Assistant
* ArcMenu Settings > Menu Buttons > Icon > Icon Size = 48
* Dash to Panel Settings > Show Applications button = OFF


GnuCash
-------

```
mkdir -p /home/john/Documents/gnucash
cp /mnt/rpi5/Documents/gnucash/finances.gnucash /home/john/Documents/gnucash/
```


Moonlight
---------

```
flatpak install flathub com.moonlight_stream.Moonlight
flatpak install flathub org.freedesktop.Platform.GL.default//22.08-extra (if needed)
```

