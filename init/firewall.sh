#!/bin/bash

function init_nat () {
	# flush existing rules to be replaced
	iptables --flush
	iptables --table nat --flush
	iptables --delete-chain
	iptables --table nat --delete-chain

	# kernel unset no forwarding
	echo 0 > /proc/sys/net/ipv4/ip_forward
}

function redirect_nat () {
	# kernel set to allow forwarding
	echo 1 > /proc/sys/net/ipv4/ip_forward

	# accept DNS requests and other than port 80 (http)
	iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
	iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
	iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

	# redirect port 80 to the second instance of squid (proxy2.some-company.net) that will give default site
	iptables -t nat -A PREROUTING -i eth0 -p tcp ! -d 192.168.40.111 --dport 80 -j DNAT --to 192.168.40.111:3300

	# exception for the nat rule after (below) to handle request to proxy.pac that is not redirected to port 3300
	iptables -t nat -A POSTROUTING -p tcp -d 192.168.40.111 --dport 80 -j ACCEPT
}

case "$1" in
 
start)
	init_nat
	redirect_nat
	;;
stop)
	init_nat
	;;
*)
	echo "Usage: $0 {start|stop}"
	;;
esac
exit 0
