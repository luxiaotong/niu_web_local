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
yarn build && yarn start &

cd ~/niu_web_global
yarn install
yarn build && yarn start &

## Nginx
sudo yum -y install nginx
cp ~/niu_web_local/niu_web.conf /etc/nginx/conf.d/niu_web.conf