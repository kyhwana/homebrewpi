#!/bin/bash
#WARNINGs
#OKs
#CRITICALs

DATE=`date`
echo "Alerting warming pin13 at $DATE $1 $2 $3 $4 $5 $6 $7 $8 $9" >>/tmp/alerts.log 
while read line
do
  echo "$line" >>/tmp/alerts.log
prestatus=`echo $line | grep temperatue`
wstatus=`echo $prestatus | awk '{ print $1}'`
temps=`echo $prestatus | awk '{print $4}' | awk -F "." '{ print $1 }'`
#run twitters
#/etc/munin/tweetstatus.py "$prestatus"
/etc/munin/ttytter.pl -keyf=/etc/munin/.ttytterkey -status="$prestatus" &

if [ "$wstatus" == "OKs:" ]; then
	ssh -i /etc/munin/raspberrypi2 root@raspberrypi2 "/home/pi/brew/test1OK.py"
	echo "$temps and running test1OK" >>/tmp/alerts.log
	#turn off LEDS
elif  [ "$wstatus" == "CRITICALs:" ]; then
	#BOTH LEDS
	echo "$temps and running criticals" >>/tmp/alerts.log
	ssh -i /etc/munin/raspberrypi2 root@raspberrypi2 "/home/pi/brew/test1CRITICAL.py"
elif  [ "$wstatus" == "WARNINGs:" ]; then
 	#justone LED
	echo "$temps and in warning" >>/tmp/alerts
	if [ "$temps" -gt "9" ]; then
		echo "$temps and executing warning" >>/tmp/alerts.log
		ssh -i /etc/munin/raspberrypi2 root@raspberrypi2 "/home/pi/brew/test1WARNING.py"
	fi
fi
done 



