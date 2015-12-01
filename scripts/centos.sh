#!/bin/bash
# update Centos with any patches
yum update -y --exclude=kernel

#tools
yum install -y nano git uznip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service http start

# PHP

yum install -y php php-cli php-common php-devel php-mysql

#mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on


service mysqld start
mysql -u root -e "SHOW DATABASES";

#DOWNLOAD STARTER CONTENT
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/srisatti/test/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/srisatti/test/master/files/info.php

 service httpd restart