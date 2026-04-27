# Arlong
(name Inspired From Onepiece Character Arlong - the captain of the all fish-man crew)


Arlong - High-Speed Recon & Automation ⚡
![wp7668978-arlong-wallpapers](https://user-images.githubusercontent.com/114536926/210381719-c0c6d0e6-7cd9-450a-87a0-4a94526126da.jpg)
Arlong is an automated subdomain discovery and redirect crawling engine designed for bug hunters. It leverages parallel execution to reduce recon time by 3x and provides deep insights into 301/302 redirect paths and technologies.🚀 Key FeaturesParallel Execution: Runs subfinder, assetfinder, and waybackurls simultaneously.Robust CRT.sh Fallback: Automatically switches to HTML parsing if the CRT.sh API is rate-limited.Advanced Redirect Probing: Specifically isolates 301/302 redirects and maps out their final destinations.
Tech Detection: Uses httpx fingerprints to identify technologies (WordPress, Nginx, Cloudflare, etc.).Global Command: Once installed, run arlong from any directory; results save locally to your current path.🛠️ 

Prerequisites:
The tool requires the following to be installed:

Golang (Go 1.19+)
System Tools: curl, jq, grep, awk

📦 Installation & Setup
Clone the Repository: 
git clone https://github.com/vinitbetkar/Arlong.git
cd Arlong
Run the Installer:
This script will install Go dependencies (subfinder, httpx, assetfinder, waybackurls) and move Arlong to your global path.
chmod +x install.sh
sudo ./install.sh
source ~/.bashrc
🎯 Usage Since Arlong is now global, you can run it from any folder. Results will be saved in a new folder named after the target domain within your current directory.

sudo arlong target.com

https://user-images.githubusercontent.com/114536926/210384923-a75a47b1-2d78-471a-b133-d05eede6aa0e.mp4

The OnePiece is Real !

Thanks!
