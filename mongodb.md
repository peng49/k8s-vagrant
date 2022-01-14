## 创建repo文件
```shell
sudo bash -c 'cat <<EOF > /etc/yum.repos.d/mongodb-org-4.4.repo
[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc
EOF'
```

## yum安装

> sudo yum install -y mongodb-org


## 启动/关闭服务
启动
>sudo systemctl start mongod

关闭
>sudo systemctl stop mongod

查看服务状态
>sudo systemctl status mongod

[Install MongoDB Community Edition on Red Hat or CentOS](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)
[How to Install MongoDB on CentOS 7](https://www.liquidweb.com/kb/how-to-install-mongodb-on-centos-7/)


## 基本操作

### 创建用户
> db.createUser({user:"admin",pwd:"Admin@123",roles:["root"]})


[How to secure MongoDB with username and password](https://stackoverflow.com/questions/4881208/how-to-secure-mongodb-with-username-and-password)
[db.createUser()](https://docs.mongodb.com/manual/reference/method/db.createUser/)