DHCP Server
===========

For the proxy auto discovery to work, DHCP server is required to have option
`252` containing information of the proxy auto discovery file `wpad.dat`.

For domain `some-company.net` it should be available via `http` to URL
`http://wpad.some-company.net/wpad.dat`.

This [RFC draft] [1] is still supported by major browsers including what's
already tested by the following sample configuration.

 [1]: http://tools.ietf.org/html/draft-ietf-wrec-wpad-01  "WPAD"
 
 
Sample configurations are for:
* Linux `dhcp3-server` (The Internet Systems Consortium DHCP Server)
* Mikrotik

For all examples:
* DHCP client addresses pool =`192.168.40.65 - 192.168.40.78`
* DNS server to resolve `wpad.some-company.net` = `192.168.40.106`
* gateway is the `squid` proxy server = `192.168.40.111`

If DNS can't be configured to resolve the above URL, WPAD won't work.

For better understanding on how the DHCP client and WPAD interacts, check
the packet captures listed in additional descriptions below.

dhcp3-server
------------

Linux used is Ubuntu 12.04 with `dhcp3-server` package installed.

WPAD information given by:

```option pac-server code 252 = text;
...
option pac-server "http://wpad.some-company.net/wpad.dat\n";
...```

Stop/start service:

`sudo service isc-dhcp-server {start|stop}`

Check packet captured for test using [Windows 7 client] [2] default IE and
[Ubuntu 12.04 client] [3] using Firefox 20.

 [2]: http://www.cloudshark.org/captures/1dc9e4cb8ca1 "Windows"
 [3]: http://www.cloudshark.org/captures/5d73416a18d5 "Ubuntu"

Mikrotik
--------

WPAD information given by:

`/ip dhcp-server option add code=252 name=pac-server value="http://wpad.some-company.net/wpad.dat\n"`

Check packet captured for test using [Windows 7 client] [4] default IE

 [4]: http://www.cloudshark.org/captures/a9b82aa8bb35 "Windows"
 
