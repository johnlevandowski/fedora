Fedora Installation
===================

* [Fedora Workstation 44](https://fedoraproject.org/workstation/download/)
* [BTRFS Snapshot and Rollback Support](https://sysguides.com/fedora-44-with-btrfs-snapshot-and-rollback-support)
* Enable third-party repositories

```
git clone https://github.com/johnlevandowski/fedora $HOME/Documents/GitHub/fedora
chmod +x $HOME/Documents/GitHub/fedora/install.sh
$HOME/Documents/GitHub/fedora/install.sh
```


## Samba Mounts

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


## Settings

* Displays - Variable Refresh Rate, HDR, Scaling
* Power > Performance
* System > About > Device Name = fedora-b850

https://github.com/johnlevandowski/dotfiles#restore-dotfiles-from-git-repository  


## Gnome Tweaks and Extensions

* Extension Manager > Installed > Background Logo = OFF
* Extension Manager > Browse
  * AppIndicator and KStatusNotifierItem Support
  * ArcMenu
  * Dash to Panel
  * Tiling Assistant
* ArcMenu Settings > Menu Buttons > Icon > Icon Size = 48
* Dash to Panel Settings > Show Applications button = OFF


## GnuCash

```
mkdir -p /home/john/Documents/gnucash
cp /mnt/rpi5/Documents/gnucash/finances.gnucash /home/john/Documents/gnucash/
```


## AppImage Support (if needed)

```
sudo dnf install fuse-libs
flatpak install flathub it.mijorus.gearlever
```


## Firewall

```
sudo ss -tulpn
```

```
sudo firewall-cmd --list-all --permanent
```

```
sudo firewall-cmd --remove-port=1025-65535/tcp --permanent 
sudo firewall-cmd --remove-port=1025-65535/udp --permanent 
sudo firewall-cmd --reload
```
