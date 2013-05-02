apache2 config
==============

Files in this folder are placed in /etc/apache2 :

* `sites-available/default`

This is the default vhost which listen to *:80
squid3 instance running `/etc/squid3/squid-landing.conf` in transparent configuration
is redirecting its traffic here.
In the background iptables is doing the redirection of incoming port 80 traffic to
the above squid3 instance 

The vhost is configured to serve proxy PAC file type, hence auto configuration URL
set in user browser is e.g. `http://proxy1.some-company.net/proxy.pac`

The vhost is also serving `wpad.dat` (proxy auto discovery) file which must be resolved
as `http://wpad.some-company.net/wpad.dat`. Note that domain is `some-company.net`,
hence `wpad.dat` must be found in `wpad.some-company.net` subdomain.
This domain and proxy auto discovery is configured in client side via DHCP request to
a DHCP server.

The above vhost config file is linked under `sites-enabled/000-default` in default
Apache2 installation of Ubuntu (it is just link naming)
