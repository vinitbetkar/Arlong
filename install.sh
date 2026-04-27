#!/bin/bash

# --- Colors ---
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
WHITE='\033[0m'

echo -e "${CYAN}[*] Starting Installation of Arlong Recon Suite...${WHITE}"

# Check for root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[!] Please run as root (sudo)${WHITE}"
   exit 1
fi

# 1. Update System & Install Core Dependencies
echo -e "${YELLOW}[+] Updating system and installing dependencies (curl, jq, git)...${WHITE}"
apt update -y && apt install -y curl jq git wget

# 2. Install Go (if not present)
if ! command -v go &> /dev/null; then
    echo -e "${YELLOW}[+] Go not found. Installing Go...${WHITE}"
    wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin:$(go env GOPATH)/bin' >> ~/.bashrc
    export PATH=$PATH:/usr/local/go/bin:$(go env GOPATH)/bin
    rm go1.22.2.linux-amd64.tar.gz
else
    echo -e "${GREEN}[✔] Go is already installed.${WHITE}"
fi

# 3. Install Subdomain & Recon Tools
echo -e "${YELLOW}[+] Installing Go-based tools...${WHITE}"

# Subfinder
echo -e "${CYAN}    - Installing Subfinder...${WHITE}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Assetfinder
echo -e "${CYAN}    - Installing Assetfinder...${WHITE}"
go install github.com/tomnomnom/assetfinder@latest

# Waybackurls
echo -e "${CYAN}    - Installing Waybackurls...${WHITE}"
go install github.com/tomnomnom/waybackurls@latest

# Httpx
echo -e "${CYAN}    - Installing HTTPX...${WHITE}"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# 4. Move Binaries to Global Path
echo -e "${YELLOW}[+] Moving binaries to /usr/local/bin for global access...${WHITE}"
GOPATH_BIN=$(go env GOPATH)/bin
cp $GOPATH_BIN/subfinder /usr/local/bin/
cp $GOPATH_BIN/assetfinder /usr/local/bin/
cp $GOPATH_BIN/waybackurls /usr/local/bin/
cp $GOPATH_BIN/httpx /usr/local/bin/

# 5. Finalize Arlong Script
if [ -f "Arlong.sh" ]; then
    chmod +x Arlong.sh
    mv Arlong.sh arlong
    cp arlong /usr/local/bin/
    echo -e "${GREEN}[✔] Arlong script is now global!${WHITE}"
else
    echo -e "${RED}[!] 'arlong' script file not found in current folder. Move it manually to /usr/local/bin/ later.${WHITE}"
fi

echo -e "${GREEN}============================================================${WHITE}"
echo -e "${WHITE}  Installation Complete! Restart your terminal or run: ${YELLOW}source ~/.bashrc${WHITE}"
echo -e "${WHITE}  You can now run: ${CYAN}arlong target.com${WHITE}"
echo -e "${GREEN}============================================================${WHITE}"
