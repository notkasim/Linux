sudo iptables -A INPUT -p tcp -m tcp --dport 60022 -j ACCEPT


sudo iptables -A INPUT -p tcp --dport 60022 --source 10.0.0.9/32 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 60022 --source 10.0.0.10/32 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 60022 --source 193.10.161.73/32 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 60022 --source 193.10.161.74/32 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 60022 --source 193.10.161.75/32 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 60022 --source 172.103.91.123/32 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j DROP