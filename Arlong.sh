#!/bin/bash

# --- Colors ---
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[0m'

# --- The Banner Function ---
function banner() {
    echo -e "${PURPLE}"
    echo -e " ▄▄▄        ██▀███   ██▓     ▒█████   ███▄    █   ▄████"
    echo -e "▒████▄    ▓██ ▒ ██▒▓██▒    ▒██▒  ██▒ ██ ▀█    █  ██▒ ▀█▒"
    echo -e "▒██  ▀█▄  ▓██ ░▄█ ▒▒██░    ▒██░  ██▒▓██  ▀█ ██▒▒██░▄▄▄░"
    echo -e "░██▄▄▄▄██ ▒██▀▀█▄  ▒██░    ▒██   ██░▓██▒  ▐▌██▒░▓█  ██▓"
    echo -e " ▓█   ▓██▒░██▓ ▒██▒░██████▒░ ████▓▒░▒██░   ▓██░░▒▓███▀▒"
    echo -e "${RED} Author: Vinit A Betkar | ${WHITE}The One Piece Is Real!"
    echo -e "${GREEN} Instagram: instagram.com/vinit.b.23"
    echo -e "${WHITE}============================================================${WHITE}"
}

# --- Root & Argument Check ---
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[!] This script must be run as root${WHITE}"
   exit 1
fi

DOMAIN=$1
if [ -z "$DOMAIN" ]; then
    banner
    echo -e "${YELLOW}[?] Usage: arlong domain.com${WHITE}"
    exit 1
fi

# Capture Current Working Directory
# This will ensures results stay where YOU are, not where the script is stored.
CURRENT_DIR=$(pwd)
OUT_DIR="$CURRENT_DIR/$DOMAIN"

# Initialize
clear
banner
echo -e "${CYAN}[*] Gomu Gomu noooooo recon: $OUT_DIR${WHITE}"
mkdir -p "$OUT_DIR"

# --- Discovery Engines ---

subfinder_run() {
    echo -e "${GREEN}[+] Gomuuuu Gomuuuuu Nooooo Subfinder ...${WHITE}"
    subfinder -silent -d "$DOMAIN" -t 100 -o "$OUT_DIR/subfinder.txt"
}

assetfinder_run() {
    echo -e "${CYAN}[+] Gomuuuu Gomuuuuu Nooooo Assetfinder ...${WHITE}"
    assetfinder --subs-only "$DOMAIN" > "$OUT_DIR/assets.txt"
}

wayback_run() {
    echo -e "${PURPLE}[+] Gomuuuu Gomuuuuu Nooooo Waybackurls ...${WHITE}"
    waybackurls "$DOMAIN" | grep -vE "\.(jpg|jpeg|gif|css|png|js|woff|woff2|svg|pdf|exe)$" | sort -u > "$OUT_DIR/wayback.txt"
}

# --- Execution ---
echo -e "${WHITE}[*] Gomuuuu Gomuuuuu Nooooo Jett Piston $DOMAIN..."

subfinder_run &
assetfinder_run &
wayback_run &

wait

# Merge findings into the current folder's domain directory
cat "$OUT_DIR/subfinder.txt" "$OUT_DIR/assets.txt" 2>/dev/null | sort -u > "$OUT_DIR/all_hosts.txt"

# --- HTTP Probing & Redirect Crawl ---
echo -e "${RED}[+] Probing 301/302 Redirects + Tech Detection...${WHITE}"
cat "$OUT_DIR/all_hosts.txt" | httpx -silent -mc 301,302 -location -td -nc -t 100 -o "$OUT_DIR/redirects_301.txt"

# Extract just the destination URLs
if [ -s "$OUT_DIR/redirects_301.txt" ]; then
    awk -F'-> ' '{print $2}' "$OUT_DIR/redirects_301.txt" | awk '{print $1}' | sort -u > "$OUT_DIR/redirect_targets.txt"
fi

echo -e "${GREEN}===================== Meshi Meshi Meshi ====================="
echo -e "${WHITE}Results saved in: ${YELLOW}$OUT_DIR${WHITE}"
