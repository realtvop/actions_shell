sudo apt install wrk -y
wrk -t 10000 -c 10000 -d 21600 https://ptc.realtvop.eu.org/epc/cmnia/Chart_IN.json