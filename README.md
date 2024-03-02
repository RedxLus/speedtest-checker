# speedtest-checker

## Info links

https://github.com/nodesource/distributions?tab=readme-ov-file#installation-instructions

https://github.com/robvanderleek/mudslide

## Before script

curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install build-essential speedtest git gawk sed curl nodejs npm -y

npx mudslide@latest -V

npx mudslide@latest login

bash checker.sh