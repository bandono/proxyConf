function FindProxyForURL(url, host) {
    var proxy1 = "PROXY proxy1.some-company.net:3128";
    var direct = "DIRECT";

    // Loopback and localhost goes browser direct always
    if ((host == "localhost") ||
       (shExpMatch(host, "localhost.*")) ||
       (host == "127.0.0.1")) {
                return direct;
        }

    // Test to see if host is an IP address
    reip = /^\d+\.\d+\.\d+\.\d+$/g;
    if (reip.test(host)) {

    // Check for an internal 192.168.40.x IP address
        if (isInNet(host, "192.168.40.0", "255.255.255.0")) {
                return direct;
        }
    }

    //Not caching ftp, rsync
     if (
         url.substring(0, 4) == "ftp:"   ||
         url.substring(0, 6) == "rsync:"
        )
    return direct;

    // proxy everything else:
    return proxy1;
}

