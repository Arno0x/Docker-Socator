### Socator is SOCAT + TOR
  
Socator container uses socat to listen on a given TCP port and to redirect incoming traffic to a tor hidden service specified through environment variables. As such it kind of acts as a relay between the standard web and a hidden service on the tor network.
  
To start the image in background (daemon mode):
  
`docker run -d -p 80:5000 -e "TOR_SITE=<target_site.onion>" -e "TOR_SITE_PORT=<target_site_port>" --name socator arno0x0x/socator`
  
You can then browse to the main page using `http://your_container_public_ip/` and you'll get forwarded to the tor hidden service