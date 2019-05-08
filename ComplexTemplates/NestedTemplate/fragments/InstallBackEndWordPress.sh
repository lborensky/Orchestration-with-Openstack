#!/bin/bash
# variables of Heat template
db_name=$WordPressDataBaseName
db_user=$WordPressUserDataBaseName
db_userpassword=$WordPressUserDataBasePassword
db_rootpassword=$WordPressRootDataBasePassword

yum -y install mariadb mariadb-server
touch /var/log/mariadb/mariadb.log
chown mysql.mysql /var/log/mariadb/mariadb.log

systemctl start mariadb.service
systemctl stop firewalld

# Setup MySQL root password and create a user
mysqladmin -u root password $db_rootpassword
cat << EOF | mysql -u root --password=$db_rootpassword
CREATE DATABASE $db_name;
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%'
IDENTIFIED BY '$db_userpassword';
FLUSH PRIVILEGES;
EXIT
EOF
