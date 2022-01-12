#/bin/sh

sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

#https://www.jianshu.com/p/2206cb265247
sudo sed -ri 's/cloud.aliyuncs/aliyun/g' /etc/yum.repos.d/CentOS-Base.repo

sudo yum clean all && sudo yum makecache

# install some tools
sudo yum install -y vim telnet bind-utils wget


# install docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

if [ ! $(getent group docker) ];
then
    sudo groupadd docker;
else
    echo "docker user group already exists"
fi

sudo touch /etc/docker/daemon.json
sudo bash -c 'cat <<EOF > /etc/docker/daemon.json
{
        "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF'

sudo gpasswd -a $USER docker
sudo systemctl restart docker

rm -rf get-docker.sh

# open password auth for backup if ssh key doesn't work, bydefault, username=vagrant password=vagrant
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo setenforce 0

sudo usermod -aG docker $USER && newgrp docker

