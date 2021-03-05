# Create the lab

## base

As `root`:
```bash
apt update && apt upgrade -y && apt install sudo
/sbin/usermod -aG sudo tristan
```

## docker installation

As `tristan`:
```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install apt-transport-https ca-certificates curl \
                     gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo -aG docker tristan
```

## install docker compose

As `tristan`:
```bash
sudo apt remove docker-compose
VERSION="1.28.2"
sudo curl -L "https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## start le projet

As `tristan`:
```bash
sudo useradd -m tic && sudo usermod -aG docker tic
sudo apt install make
```

As `tic`:
```bash
ssh-keygen -N "" -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub
# add ssh pub key to (https://github.com/0b11stan/docker-tic/settings/keys)
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone git@github.com:0b11stan/docker-tic.git
cd docker-tic
git submodule init
git submodule update
make up
```
