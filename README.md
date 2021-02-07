Based off the Jeronslot repo. Creates a docker container running Alpine that uses your NordVPN account. Handy for routing other container traffic through it to act as a proxy. Some minor edits and changes

# Features
- Connects to the recommended server for you! Provided by the API.
- Reconnects if the load is to high on a NordVPN server (Depends on setup CRON).
- Reconnects to random servers if specified
- Healthcheck if the connection is not secure.
- Privoxy to use it elsewhere, for private browsing!
- Connect your other containers, so they have a secured connection as well. A cool Docker feature :)
- It will download the ovpn files daily! So you will stay up-to-date with the latest ovpn files.
- Connect to the country that you select! The API will find the fastest server.

# Prerequisite 
You will need a [NordVPN](https://nordvpn.com) account.

# Environment Variables

- `USERNAME` Username of your NordVPN account
- `PASSWORD` Password of your NordVPN account
- `LOCAL_NETWORK` - The CIDR mask of the local IP network (e.g. 192.168.1.0/24, 10.1.1.0/24). This is needed to respond to your client.
- `CRON` Defaults every 15 minutes; checks the load of the VPN server.  
- `LOAD` Defaults to 75; if the load is greater than this then the container will connect to a less utilised VPN server.
- `COUNTRY` Defaults to the VPN server closest to you; however this can be manually set to a specific country. For example if you want your traffic to only be served through Canada put "CA"... See https://nordvpn.com/servers/ for list of locations. 
- `PROTOCOL` Defaults to TCP, you can change it to `UDP`.
- `SERVER` *Optional*... If set it connects to the server you specify. Example server name format: `ca1191.nordvpn.com`.