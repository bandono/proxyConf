iptables redirect http
=====================

File `firewall.sh` is to be placed in:

* `/usr/local/bin/firewall.sh`

It will be called by init by T.B.D

squid3 init
===========

After installing from repository, Ubuntu will place the init in `upstart` style
(instead of `/etc/rc*.d/` style) making it available as:

* ```sudo service start|stop|restart```

with configuration found as `/etc/init/squid3.conf`

Adding `/etc/init/squid3.override` can be done to edit some stanza by not touching
the original/default `.conf` file.
