### Socator is SOCAT + TOR
  
Socator container uses socat to listen on a given TCP port and to redirect incoming traffic to a tor hidden service specified through environment variables. As such it kind of acts as a relay between the standard web and a hidden service on the tor network.

You can optionnally restrict the IP addresses that are allowed to connect to this service by specifying an `ALLOWED_RANGE` environment variable and using CIDR notation.

Examples
--------------
To start the image in background (*daemon mode*) with IP address restriction:
  
`docker run -d -p 80:5000 -e "ALLOWED_RANGE=10.0.0.0/" -e "TOR_SITE=<target_site.onion>" -e "TOR_SITE_PORT=<target_site_port>" --name socator arno0x0x/socator`

To start the image in foreground:
  
`docker run -ti -p 80:5000 -e "TOR_SITE=<target_site.onion>" -e "TOR_SITE_PORT=<target_site_port>" --name socator arno0x0x/socator`

You can then browse to the main page using `http://your_container_public_ip/` and you'll get forwarded to the tor hidden service