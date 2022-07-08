#!/bin/bash
# nc-client.sh  
## By tweeks@VirginiaCyberRange.org, 2022-07-08
## To be run on the RPi client or classroom laptop and pointed at the server to generate some 
## light http and raw netcat traffic.

export SERVER=192.168.1.1

## Non-web flag traffic
export PORT=1337
export FLAG="flag{TXT-FLAG-HERE}"

## Put various web server traffic pages here... (generate background noise)
export PAGE1=/Status_Router.asp
export PAGE2=/Wireless_Basic.asp
export PAGE3=/SysInfo1.htm
export PAGE4=/Status_Router.asp
export PAGE5='/style/xirian/images/logo.png '
## Router username/password (to harvest a http-basic auth session)
export USERPASS=" -auth=root:linksys "
#export USERPASS=" "

while [ 1 ]; do 
echo "============================================================"
echo "###################### SENDING 1337 FLAG ###################"
(echo -e "=====================================================\n\nHello 133t 53rv3r" ; echo "The flag is $FLAG"; echo -e "\n\n\n" ) | nc $SERVER $PORT
echo "============================================================"
sleep 1
lynx $USERPASS -dump http://$SERVER$PAGE1
echo "=============================="
sleep 1
lynx $USERPASS -dump http://$SERVER$PAGE2
echo "=============================="
sleep 1
lynx $USERPASS -dump http://$SERVER$PAGE3
echo "=============================="
sleep 1
lynx $USERPASS -dump http://$SERVER$PAGE4
echo "=============================="
sleep 1
lynx -dump http://$SERVER$PAGE5  | strings -e s
echo "=============================="
sleep 1
lynx -dump http://$SERVER/
sleep 1
done

