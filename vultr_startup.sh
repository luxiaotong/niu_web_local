#!/bin/bash

# Vultr Startup Script

## Github
yum -y install git
cd ~/
git clone https://github.com/luxiaotong/niu_web_local.git
git clone https://github.com/luxiaotong/niu_web_global.git


## Node && Yarn
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum -y install yarn

## Run Nuxt
cd ~/niu_web_local
yarn install
#yarn build && yarn start &
./node_modules/pm2/bin/pm2 start npm --name "web_local" -- run prod

cd ~/niu_web_global
yarn install
#yarn build && yarn start &
../niu_web_local/node_modules/pm2/bin/pm2 start npm --name "web_global" -- run prod

## Nginx
sudo yum -y install nginx
mkdir /etc/nginx/servers
cp ~/niu_web_local/nginx.conf /etc/nginx/nginx.conf
cp ~/niu_web_local/niu_web.conf /etc/nginx/servers/niu_web.conf
sudo nginx
