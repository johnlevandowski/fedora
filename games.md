Gaming
======

## Install

```
sudo dnf install steam gamescope
```

The first time you run Steam, it will update itself to the latest version.  This process can take some time.  

```
sudo dnf copr enable faugus/faugus-launcher
sudo dnf install faugus-launcher
```


## Gamescope Steam launch options

When using display scaling, many games don't scale/full screen correctly.  Gamescope seems to be the recommended solution.  

```
gamescope -w 2560 -h 1440 -W 2560 -H 1440 -r 180 --fullscreen --hdr-enabled --adaptive-sync -- %command%
```


## Moonlight

```
flatpak install flathub com.moonlight_stream.Moonlight
```
