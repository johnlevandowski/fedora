Virtual Machine
===============

Install qemu virtualization
---------------------------

https://libvirt.org/daemons.html#switching-to-modular-daemons  

```
sudo dnf install virt-install virt-manager
libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm
```

```
for drv in qemu interface network nodedev nwfilter secret storage
    sudo systemctl unmask virt{$drv}d.service
    sudo systemctl unmask virt{$drv}d{,-ro,-admin}.socket
    sudo systemctl disable virt{$drv}d.service
    sudo systemctl enable --now virt{$drv}d{,-ro,-admin}.socket
end
```

```
sudo usermod -aG kvm,libvirt $(whoami)
```

Logout for new group memberships to take effect  


Test qemu connection
--------------------

```
virsh -c qemu:///system
virsh -c qemu:///session
```
