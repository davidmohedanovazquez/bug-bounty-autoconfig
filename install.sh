#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

echo """
# Manual aliases
alias ll='ls -lh --group-directories-first'
alias la='ls -a --group-directories-first'
alias l='ls --group-directories-first'
alias lla='ls -lha --group-directories-first'
alias ls='ls --group-directories-first'
""" >> ~/.bash_profile
source ~/.bash_profile



#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					# wget https://go.dev/dl/go1.20.4.linux-arm64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					# sudo tar -xvf go1.20.4.linux-arm64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


mkdir ~/tools && cd ~/tools


#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python3 setup.py install
cd ~/tools/
echo "done"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "done"

#install ffuf
echo "Installing ffuf"
go install github.com/ffuf/ffuf/v2@latest
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"

echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing gf"
go get -u github.com/tomnomnom/gf
echo "done"

echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "installing naabu"
go get -u -v github.com/projectdiscovery/naabu/v2/cmd/naabu
echo "done"

echo "installing nuclei"
go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
echo "done"

echo "downloading nuclei-templates"
git clone https://github.com/projectdiscovery/nuclei-templates ~/nuclei-templates
echo "done"

echo "downloading fuzzing-templates"
git clone https://github.com/projectdiscovery/fuzzing-templates.git ~/fuzzing-templates
echo "done"

echo "installing subfinder"
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo "done"

echo "installing chaos"
GO111MODULE=on go get -v github.com/projectdiscovery/chaos-client/cmd/chaos
echo "done"

echo "installing dnsx"
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
echo "done"

echo "installing notify"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
echo "done"

echo "installing dalfox"
go get -u -v github.com/hahwul/dalfox
echo "done"

echo "installing gau"
go get -u -v github.com/lc/gau
echo "done"

echo "installing subjs"
GO111MODULE=on go get -u -v github.com/lc/subjs
echo "done"

echo "installing hakrawler"
go get github.com/hakluke/hakrawler
echo "done"

echo "installing hakrevdns"
go get github.com/hakluke/hakrevdns
echo "done"

echo "installing httpx"
go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
echo "done"

echo "installing katana"
go install github.com/projectdiscovery/katana/cmd/katana@latest
echo "done"

echo "installing LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder
echo "done"

echo "installing SecretFinder"
git clone https://github.com/m4ll0k/SecretFinder
echo "done"

echo "installing anew"
go install -v github.com/tomnomnom/anew@latest
echo "done"

echo "installing ParamSpider"
git clone https://github.com/devanshbatham/ParamSpider
echo "done"

echo "installing dnsprobe"
go get -u -v github.com/projectdiscovery/dnsprobe
echo "done"

echo "installing kxss"
go get github.com/Emoe/kxss
echo "done"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd knock
pip3 install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing gowitness"
go install github.com/sensepost/gowitness@latest
echo "done"
# -- choose one of this two tools
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

echo "downloading Gf-Patterns"
git clone https://github.com/1ndianl33t/Gf-Patterns ~/Gf-Patterns
sudo mkdir /root/.gf
mv ~/Gf-Patterns/*.json /root/.gf/
rm -r ~/Gf-Patterns
echo "done"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"

https://github.com/walles/riff/releases/download/2.23.3/riff-2.23.3-x86_64-linux
echo "installing riff"
wget https://github.com/walles/riff/releases/download/2.23.3/riff-2.23.3-x86_64-linux
chmod a+x riff-*
mv riff-* /usr/local/bin/riff
echo "done"



echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo -e "\n\n-> Don't forget to set your subfinder config file with all your API keys!"
echo "-> Don't forget to set notify with your credentials!"


# cosas pendientes:
# - WhatWeb ¿?
