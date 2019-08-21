# web_local

> My flawless Nuxt.js project

## Build Setup

``` bash
# install dependencies
$ yarn install

# serve with hot reload at localhost:3000
$ yarn dev

# build for production and launch server
$ yarn build
$ yarn start

# generate static project
$ yarn generate
```

For detailed explanation on how things work, check out [Nuxt.js docs](https://nuxtjs.org).


# Vultr Startup Script

## Github
``` bash
yum -y install git
$ cd ~/
$ git clone https://github.com/luxiaotong/niu_web_local.git
$ git clone https://github.com/luxiaotong/niu_web_global.git
```

## Node && Yarn
``` bash
$ curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
$ curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
$ sudo yum -y install yarn
```

## Nuxt
``` bash
$ cd ~/niu_web_local
$ yarn install
$ yarn build && yarn start &

$ cd ~/niu_web_global
$ yarn install
$ yarn build && yarn start &
```

## Nginx

``` bash
$ sudo yum -y install nginx
$ cp ~/niu_web_local/niu_web.conf /etc/nginx/conf.d/niu_web.conf
```
