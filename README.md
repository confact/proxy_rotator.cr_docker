# proxy_rotator.cr_docker
The docker of proxy_rotator.cr with simple sample config


## ENVs:
* PROXY_USERNAME = username
* PROXY_PASSWORD = password
* PROXYLIST_PATH = path to proxylist file (incl filename)

port: 3199
host: 0.0.0.0

## Proxylist
the proxylist is simple textfile with proxies, in this format:
```
ip:port:username:password
```
