# WiFi_traffic_scripts
Bash scripts for creating netcat client / server traffic.. designed to run on a client and connect to a server or web-router to generate traffic for monitoring sniffing lab.

**SNIFF-THIS** - Client/server traffic generator (for CTF challenges) to be used on a classroom laptop and pointed at a classroom server/router to generate some light http and raw netcat traffic. Recommend using a WRT or TP-Link WiFi router and DDWRT flash image (very flexible)

**SNIFF-MORE** - This Software Defined Radio challenge (participants need access to an RTL-SDR USB receiver and GQRX SDR software) uses the [VACR_CTF_arduino-mit](https://github.com/Tweeks-va/VACR_CTF_arduino-xmit-cw) code, and the classroom transmitter just needs a simple arduino, 9v battery and loop of wire.

**CRACK-THIS** - Client/AP traffic generator (for CTF challenge) to be used on a classroom laptop, pointed to a WEP capable Access Point so that traffic can be sniffed, and the WEP key brute forced. Designed to be run in a crontab */15 minutes so that it's always running (generating traffic).
 

 
