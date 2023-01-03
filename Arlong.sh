#!/bin/bash  

clear
Black='\033[1;30m'        # Black
Red='\033[1;31m'          # Red
Green='\033[1;32m'        # Green
Yellow='\033[1;33m'       # Yellow
Blue='\033[1;34m'         # Blue
Purple='\033[1;35m'       # Purple
Cyan='\033[1;36m'         # Cyan
White='\033[0m'
blue='\033[0;34m'
Brown='\033[1;32m'
Brownn='\033[0;33m'

echo -e "${Purple}
 ▄▄▄       ██▀███   ██▓     ▒█████   ███▄    █   ▄████ 
▒████▄    ▓██ ▒ ██▒▓██▒    ▒██▒  ██▒ ██ ▀█   █  ██▒ ▀█▒
▒██  ▀█▄  ▓██ ░▄█ ▒▒██░    ▒██░  ██▒▓██  ▀█ ██▒▒██░▄▄▄░
░██▄▄▄▄██ ▒██▀▀█▄  ▒██░    ▒██   ██░▓██▒  ▐▌██▒░▓█  ██▓
 ▓█   ▓██▒░██▓ ▒██▒░██████▒░ ████▓▒░▒██░   ▓██░░▒▓███▀▒
 ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ░▒   ▒ 
  ▒   ▒▒ ░  ░▒ ░ ▒░░ ░ ▒  ░  ░ ▒ ▒░ ░ ░░   ░ ▒░  ░   ░ 
  ░   ▒     ░░   ░   ░ ░   ░ ░ ░ ▒     ░   ░ ░ ░ ░   ░ 
      ░  ░   ░         ░  ░    ░ ░           ░       ░ 
                                                       

 

                          ${Red} Author:40RU5X_x
     ${White} Make Bug Hunting Wild With Automation
     ${Purple} The One piece Is Real !
     ${Green} Instagram:instagram.com/40ru5x_x"

echo -e "============================================================"
if [[ $EUID -ne 0 ]]; then
   echo -e " ${Cyan} This script must be run as root" 
   exit 1
fi
                        DOMAIN=$1
sleep 1

echo -e "${White}  Let's Goo....."
mkdir $DOMAIN


subfinder()
{
   echo -e "${Green}=============activating the subfinder======================="
	sudo subfinder -silent -d $DOMAIN -t 100  -o $DOMAIN/subfinder_$DOMAIN.txt
	echo -e "${Yellow}======================done==============================="
}


sleep 1

crt()
{
      echo -e "${Red}=============activating the crt======================="
      curl -s "https://crt.sh?q=$DOMAIN" | grep -Eo "<TD>[a-z0-9.]+</TD>" | tr -d "</TD>" | sort | uniq > $DOMAIN/crt_$DOMAIN.txt
      echo -e "${Yellow}======================done==============================="
}
sleep 1


#subdoamin.
sorting()
{
   echo -e "${Green}=============activating the sorting======================="
	sudo sort $DOMAIN/subfinder_$DOMAIN.txt $DOMAIN/crt_$DOMAIN.txt | uniq -u | tee $DOMAIN/all_sorted_$DOMAIN.txt
   echo -e "${Yellow}======================done==============================="
}
sleep 1
httpxqq()
{
   echo -e "${Red} =============activating the httpxqq======================= "
   sleep 1
	sudo cat $DOMAIN/all_sorted_$DOMAIN.txt | httpx -silent -threads 50 | tee -a $DOMAIN/httpx_$DOMAIN.txt
   echo -e "${Yellow}======================done==============================="
}
sleep 1


wayback()
{
   echo -e "${Green} =============activating the wayback======================= "
	sudo cat $DOMAIN/httpx_$DOMAIN.txt | waybackurls > $DOMAIN/wayback_$DOMAIN.txt
	echo -e "${Yellow}===================== Done recon ====================="
}

sleep 1

subfinder
crt
sorting
httpxqq
wayback
