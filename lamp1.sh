#!/bin/bash
sudo yum update -y
sudo yum install emacs -y
sudo yum install mysql -y
sudo yum install php -y
sudo yum install git -y
sudo yum install aws-cli -y
sudo yum install gd -y
sudo yum install php-gd -y
sudo yum install ImageMagick -y
sudo yum install php-mysql -y


sudo yum install -y httpd24
sudo service httpd start
sudo chkconfig httpd on
sudo chmod 644 /root
sudo echo "[client]" >> /root/.my.cnf
sudo echo "host=my-rds.ccccjjjjuuuu.us-east-1.rds.amazonaws.com" >> /root/.my.cnf
sudo echo "user=root" >> /root/.my.cnf
sudo echo "password=abc123" >> /root/.my.cnf


export COMPOSE_HOME=/root
sudo echo "installing composer..."
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php
sudo php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

sudo aws s3 cp s3://iheavy-config/iheavy_files.zip .

sudo unzip iheavy_files.zip

sudo composer update

sudo mv wordpress/* /var/www/html/

sudo mv wp-content/plugins/* /var/www/html/wp-content/plugins/

sudo mv a_simple_pingdom_test.php /var/www/html

sudo mv htaccess /var/www/html/.htaccess

sudo mv iheavy_httpd.conf /etc/httpd/conf.d

sudo mv wp-config.php /var/www/html

sudo service httpd restart

sudo chown apache /var/www/html/wp-content

sudo tail -f /var/log/cloud-init.log
