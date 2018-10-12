#!/bin/bash

i=1

testa_ip() {
	ping -c 1 $1 > /dev/null
	if [ $? = 0 ]
	then
		echo " $1 esta alcancavel"
		nc -vznw 1 $1 1-65535 &> /dev/null
		if [ $? != 148 ]
			then
				echo opa
			fi
		fi
	}

while [ $i -le 255 ]
do
	testa_ip 192.168.56.$i &
	# { sleep 5; echo "ainda rodando"; } &
	# wait

	((i++))
done
