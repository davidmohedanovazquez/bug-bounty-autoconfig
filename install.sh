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
					rm go1.13.4.linux-amd64.tar.gz
					#rm go1.20.4.linux-arm64.tar.gz
					go env -w GO111MODULE=auto
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
go install github.com/tomnomnom/httprobe@latest
echo "done"

echo "installing unfurl"
go install github.com/tomnomnom/unfurl@latest
echo "done"

echo "installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest
echo "done"

echo "installing gf"
go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
source ~/.bashrc
echo "done"

echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "installing naabu"
sudo apt install -y libpcap-dev
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo "done"

echo "installing nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "done"

echo "downloading nuclei-templates"
git clone https://github.com/projectdiscovery/nuclei-templates ~/nuclei-templates
echo "done"

echo "downloading fuzzing-templates"
git clone https://github.com/projectdiscovery/fuzzing-templates.git ~/fuzzing-templates
echo "done"

echo "installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "done"

echo "installing chaos"
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
echo "done"

echo "installing dnsx"
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
echo "done"

echo "installing notify"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
echo "done"

echo "installing dalfox"
go install github.com/hahwul/dalfox/v2@latest
echo "done"

echo "installing gau"
go install github.com/lc/gau/v2/cmd/gau@latest
echo "done"

#echo "installing subjs"
#go install github.com/lc/subjs@latest
#echo "done"

echo "installing hakrawler"
go install github.com/hakluke/hakrawler@latest
echo "done"

echo "installing hakrevdns"
go install github.com/hakluke/hakrevdns@latest
echo "done"

echo "installing httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
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

echo "installing kxss"
wget https://github.com/tomnomnom/hacks/archive/refs/heads/master.zip
unzip master.zip
cd hacks-master/kxss/
go env -w GO111MODULE=auto
go build
sudo cp kxss /usr/local/go/bin/
cd ~/tools/
rm -r hacks-master
rm master.zip
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
#echo "Installing Aquatone"
#go get github.com/michenriksen/aquatone
#echo "done"

echo "downloading Gf-Patterns"
git clone https://github.com/1ndianl33t/Gf-Patterns ~/Gf-Patterns
sudo mkdir /root/.gf
sudo mv ~/Gf-Patterns/*.json /root/.gf/
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

echo "installing riff"
wget https://github.com/walles/riff/releases/download/2.23.3/riff-2.23.3-x86_64-linux
sudo chmod a+x riff-*
sudo mv riff-* /usr/local/bin/riff
echo "done"



echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo -e "\n\n-> Don't forget to set your subfinder config file with all your API keys! (in)"
echo "-> Don't forget to set notify with your credentials!"


# cosas pendientes:
# - WhatWeb ¿?
