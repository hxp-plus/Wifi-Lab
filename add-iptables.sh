iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables -P FORWARD ACCEPT
iptables --table nat --append POSTROUTING --out-interface $1 -j MASQUERADE
iptables --append FORWARD --in-interface $1 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward
ifconfig wlan1 10.0.0.1
