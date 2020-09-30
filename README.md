# hxp's Wifi Lab (under construction)

To start the wireless access point, first you need to install `hostapd` and `dnsmasq`.

and run

```bash
sudo hostapd hostapd.conf
```

to start the access point, then run

```bash
sudo dnsmasq -C dnsmasq.conf -H fakehosts.conf -d
```

to start a DNS server, at last, you need to do the routing with `iptables`, run

```bash
sudo ./add-iptables.sh <destination_interface>
```

for example, if you need to route all the network traffic to `tun0`, run

```bash
sudo ./add-iptables.sh tun0
```

## Truoble Shooting

### unstable hotspot

add your iface to unmanaged in NetworkManager

edit `/etc/NetworkManager/NetworkManager.conf`, add `wlan1` to unmanaged

```
[keyfile]
unmanaged-devices=interface-name:wlan1
```

and restart service

```bash
sudo systemctl restart NetworkManager
```

See also: https://wiki.archlinux.org/index.php/software_access_point#NetworkManager_is_interfering