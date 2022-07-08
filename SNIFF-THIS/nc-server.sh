#!/bin/sh
# nc-server.sh
## By tweeks@VirginiaCyberRange.org, 2022-07-08
## Netcat listener to give clients something to connect to to pass traffic.  Either run
## this script in your rc/startup, or copy the one liner into the router's startup scripts
## config (e.g. as in ddwrt) to run contunuously after booting.


while [ 1 ]; do nc -l -p 1337 > /dev/null & sleep 10; killall -9 nc; done

## I made this into a one liner bc it can be popped into a dd-wrt nvram startup.
## NOTE: May create zombie processes.. Recommend an hourly cron reboot.




