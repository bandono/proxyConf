function FindProxyForURL(url, host) {
    var proxy1 = "PROXY proxy1.some-company.net:3128";
    var direct = "DIRECT";

    // no proxy for local hosts without domain:
    if (isPlainHostName(host)) return direct;

    //Not caching ftp, rsync
     if (
         url.substring(0, 4) == "ftp:"   ||
         url.substring(0, 6) == "rsync:"
        )
    return direct;

    // proxy everything else:
    return proxy1;
}

