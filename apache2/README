apache2 config
==============

Files in this folder are placed in /etc/apache2 :

1. ports.conf
Add port 81 to listen to other than default port 80

2. sites-available/default
This is the default vhost which listen to *:80
squid3 instance running /etc/squid3/squid-landing.conf in transparent configuration
is redirecting its traffic here.
In the background iptables is doing the redirection of incoming port 80 traffic to
the above squid3 instance 

3. sites-available/default-proxy
This is the additional vhost listenning to *:81
The vhost is configured to serve proxy PAC file type, hence auto configuration URL
set in user browser is e.g. http://proxy1.some-company.net:81/proxy.pac

4. both of the above vhost config files are linked under sites-enabled/some-file
