squid3 config
=============

There are two squid3 instances for the default landing page of using transparent proxy
and for the proxy itself with authentication (requiring user action to change their
browser setting).

In this case both are hosted within the same server with IP address 192.168.40.111
managing 192.168.40.0/24 network. The host is also resolvable with some naming e.g.
proxy1.some-company.net

* `squid-landing.conf`

This squid3 instance is listening to port 3300 in transparent mode.
iptables redirect incoming *:80 (`http`) requests to this port.
a landing page will show up instead to show instruction on how user can change their
browser setting.

Manually start this instance by:

`$ /usr/sbin/squid3 -f /etc/squid3/squid-landing.conf`

* `squid-ncsa.conf`

This is the proxy, listening to port 3128, related user setting can be found in
`proxy.pac`, the PAC file that will configure the browser.

Authentication used is NCSA using list of username-password in `/etc/squid3/passwd`
Generating password is done by doing e.g.:

`$ htpasswd /etc/squid3/passwd some-user`

Manually start this instances by:

`$ /usr/sbin/squid3 -f /etc/squid3/squid-ncsa.conf`

* `corpdomainlist`

This is used by the proxy for allowed sites that need no proxy authentication.
