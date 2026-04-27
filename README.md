# Arlong
(name Inspired From Onepiece Character Arlong - the captain of the all fish-man crew)


Arlong - High-Speed Recon & Automation ⚡
![wp7668978-arlong-wallpapers](https://user-images.githubusercontent.com/114536926/210381719-c0c6d0e6-7cd9-450a-87a0-4a94526126da.jpg)

Arlong is a high-speed subdomain discovery and redirect crawling engine built for modern Bug Hunters. By leveraging parallel execution, Arlong cuts down recon time by 3x while providing deep insights into technologies and hidden redirect paths.

⚡ Key Features
Parallel Engines: Runs Subfinder, Assetfinder, and Waybackurls at the same time to maximize speed.

Intelligent Fallback: If CRT.sh JSON API is busy, Arlong automatically switches to an HTML scraping method so you never lose data.

Deep Redirect Mapping: Specifically isolates 301/302 redirects, identifies the final destination, and saves them separately.

Stack Identification: Integrated httpx fingerprints detect technologies like WordPress, Nginx, Cloudflare, and Jira.

Global Access: Once installed, Arlong is a system command. Run it from any folder; results stay where you are.

🛠️ Prerequisites
Before installing, ensure you have the following:

Golang (Go 1.19 or higher)

System Tools: curl, jq, grep, awk

📦 Installation & Setup
Get Arlong up and running in less than two minutes:


# 1. Clone the repository
git clone https://github.com/vinitbetkar/Arlong.git

cd Arlong

# 2. Run the automated installer
# This handles Go dependencies and moves Arlong to your global path
chmod +x install.sh

sudo ./install.sh

# 3. Refresh your environment

source ~/.bashrc

🎯 Usage
Since Arlong is now a global command, simply navigate to your research folder and run:

sudo arlong target.com

📂 Output Structure
All results are neatly organized in a folder named after your target:

https://user-images.githubusercontent.com/114536926/210384923-a75a47b1-2d78-471a-b133-d05eede6aa0e.mp4

The OnePiece is Real !

Thanks!
