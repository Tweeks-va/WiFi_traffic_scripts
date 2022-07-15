#!/bin/bash
# nc-client.sh  
## By tweeks@VirginiaCyberRange.org, 2022-07-08
## To be run on the RPi client or classroom laptop and pointed at the server to generate some 
## light http and raw netcat traffic.

export SERVER=192.168.140.1

## Non-web flag traffic
export PORT=31337
export FLAG="flag{theflag}"

## Put various web server traffic pages here... (generate background noise)
export PAGE1=
export PAGE2=/basic-network.asp
export PAGE3=/advanced-adblock.asp
export PAGE4=/advanced-wireless.asp
export PAGE5='/openlinksys.png '
## Router username/password (to harvest a http-basic auth session)
export HTTPUSER="admin"
export HTTPPASS="password"
export USERPASS=" -auth=$HTTPUSER:$HTTPPASS "
#export USERPASS=" "

#export WEBBIN="lynx -dump "
export WEBBIN="wget --http-user=$HTTPUSER --http-password=$HTTPPASS --no-check-certificate -q -O - "


## Loop this web traffic forever...
while [ 1 ]; do 
## Not using (OpenWRT nc can't do local binding)
#echo "============================================================"
#echo "##################### SENDING 31337 FLAG ###################"
#(echo -e "=====================================================\n\nH3ll0 th3r3 N3tg34r r0ut3r!   \n\n" ; echo "The flag is $FLAG"; echo -e "\n\n\n" ) | nc $SERVER $PORT
#echo "============================================================"
#sleep 1

## Let's just generate some traffic (with an http auth-basic user:pass in it)
#WEBBIN $USERPASS -dump http://$SERVER$PAGE1
echo "=========PAGE2================"
sleep 1
$WEBBIN http://$SERVER$PAGE2
echo "=========PAGE3================"
sleep 1
$WEBBIN http://$SERVER$PAGE3
echo "=========PAGE4================"
sleep 1
$WEBBIN http://$SERVER$PAGE4
echo "=========PAGE5================"
sleep 1
$WEBBIN http://$SERVER$PAGE5 | strings
echo "=========MAIN-SEVRER=========="
sleep 1
$WEBBIN http://$SERVER/
sleep 1
done

