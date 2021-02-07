Based off the Jeronslot repo. Creates a docker container running Alpine that uses your NordVPN account. Handy for routing other container traffic through it to act as a proxy. 

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

## Environment Variables

- `USERNAME` Username of your account
- `PASSWORD` Password of your account
- `LOCAL_NETWORK` - The CIDR mask of the local IP network (e.g. 192.168.1.0/24, 10.1.1.0/24). This is needed to response to your client.
- `CRON` You can set this variable to change the default check of every 15 minutes. This will be used to check if the LOAD is still OK. This can be changed using the CRON syntax.
- `LOAD` If the load is > 75 on a NordVPN server, OpenVPN will be restarted and connects to the recommended server for you! This check will be done every 15 minutes by CRON.
- `RANDOM_TOP` *Optional*, if set, it will randomly select from the top "x" number of recommended servers. Valid values are integers between 1 and the number of servers that nord has.
- `COUNTRY` *Optional*, you can choose your own country by using the two-letter country codes that are supported by NordVPN.
- `PROTOCOL` *Optional*, default set to `tcp`, you can change it to `udp`.
- `SERVER` *Optional*, if not set, connects to the recommended server for you. If set, connects to the server you specify. Example server name format: `us2484.nordvpn.com`.