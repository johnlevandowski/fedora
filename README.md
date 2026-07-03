Fedora Installation
===================

[Fedora Workstation 44](https://fedoraproject.org/workstation/download/)

```
sudo dnf update
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


Settings
--------

Dark mode


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
* ArcMenu Settings > Menu Buttons > Icon > Icon Size = 48
* Dash to Panel Settings > Show Applications button = OFF


Moonlight
=========

```
flatpak install flathub com.moonlight_stream.Moonlight
flatpak install flathub org.freedesktop.Platform.GL.default//22.08-extra (if needed)
```

