#!/bin/bash

# variables of Heat template
db_name=$WordPressDataBaseName
db_user=$WordPressUserDataBaseName
db_userpassword=$WordPressUserDataBasePassword
db_ipaddr=$WordPressDataBasePrivateIPAddress

yum -y install httpd wordpress

sed -i -e "/Deny from All/d"				/etc/httpd/conf.d/wordpress.conf
sed -i -e "s/Require local/Require all granted/"	/etc/httpd/conf.d/wordpress.conf

sed -i -e "s/database_name_here/$db_name/"	/etc/wordpress/wp-config.php
sed -i -e "s/username_here/$db_user/"      	/etc/wordpress/wp-config.php
sed -i -e "s/password_here/$db_userpassword/"	/etc/wordpress/wp-config.php
sed -i -e "s/localhost/$db_ipaddr/"		/etc/wordpress/wp-config.php

setenforce 0 # Otherwise net traffic with DB is disabled

systemctl start httpd.service
systemctl enable httpd.service
