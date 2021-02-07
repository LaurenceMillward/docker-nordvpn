Based off the Jeronslot repo. Creates a docker container running Alpine that uses your NordVPN account. Handy for routing other container traffic through it to act as a proxy. Also runs privoxy exposed over port 8118 to allow the use of routing home / mobile internet via the docker-nordvpn container. Some minor edits and changes have been made, for example, upgrading Alpine to latest release. All edits can be seen in GitHub. 

# Features
- Automatically connects to your closest NordVPN server.
- If the load is over a defined limit, will automatically re-connect to the next best server. 
- Healthcheck every minute to ensure the connection is secure. 
- Privoxy exposed over port 8118. 
- Connect your other containers to the docker-nordvpn network to secure / hide their traffic.
- ovpn files update daily to ensure there's no dud servers over time. 


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
- `GROUP` *Optional*...If set it will connect to a recommended server for you, based on server group (for example: legacy_p2p).