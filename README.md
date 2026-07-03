Fedora Installation
===================


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


AppImage Support
----------------

Only if needed

```
sudo dnf install fuse-libs
flatpak install it.mijorus.gearlever
```


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
  * Dash to Dock or Dash to Panel
  * AppIndicator and KStatusNotifierItem Support

