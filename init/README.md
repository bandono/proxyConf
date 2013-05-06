upstart squid3
==============

`squid3` is installed in Ubuntu 12.04 where it already began to use `upstart`
for sometime instead of `init.d` to start/stop the service during reboot/
poweroff.

iptables redirect http
----------------------

File `firewall.sh` is to be placed in:

`/usr/local/bin/firewall.sh`

It will be called by `upstart` job of the second `squid3` as `pre-start`
and `post-stop` stanzas in:

`/etc/init/squid3ins2.conf` 


We can call it manually:

`/usr/local/bin/firewall.sh {start|stop}`



squid3 init
-----------

After installing from repository, Ubuntu will place the init in `upstart` style
(instead of `/etc/rc*.d/` style) making it available as e.g.:

```sudo service start|stop|restart```

with `init` job configuration found as `/etc/init/squid3.conf` 

Adding `/etc/init/squid3.override` can be done to edit some `upstart` stanzas
by not touching the original/default `.conf` file.

Inside the job config there is a call to `exec` which prevents calling two
`squid3` instances as it will check whether there is already a running instance.
The `respawn` option put `upstart` on attempt of restarting the job when it
is killed unexpectedly.

Workaround: link `/usr/sbin/squid3` as another name in this case
`/usr/sbin/squid3ins2`:

```cd /usr/sbin/
sudo ln -s squid3 squid3ins2
```

We can then have a second `upstart` job with `exec` call to `squid3ins2` without
killing the first instance. Hence, we have two (multiple) `squid3` instances
started during reboot. The second job name here is `/etc/init/squid3ins2.conf`

