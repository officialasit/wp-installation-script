#!/bin/bash -e

dir="/var/www/html"
dbname="wordpress"
dbuser="root"
dbpass="sshs"

clear
echo "============================================"
echo "WordPress Installation Script"
echo "============================================"
echo "run install? (y/n)"
read -e run
if [ "$run" == n ] ; then
	exit
else
	echo "============================================"
	echo "Installing Packages ..."
	echo "============================================"
	sudo apt-get update
	sudo apt-get install apache2 -y
	sudo apt-get install php libapache2-mod-php -y
	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password sshs'
	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password sshs'
	sudo apt-get install mariadb-server -y
	sudo apt-get install php-mysql -y

	echo "============================================"
	echo "Installing WordPress ..."
	echo "============================================"
	sudo wget https://wordpress.org/latest.zip -O /var/www/html/wordpress.zip
	sudo unzip /var/www/html/wordpress.zip -d /var/www/html/
	sudo mv /var/www/html/wordpress/* /var/www/html
	sudo rm -rf /var/www/html/wordpress.zip

	sudo /etc/init.d/apache2 reload

	sudo chmod 755 /var/www/html -R
	sudo chown www-data /var/www/html -R

	echo "================================================="
	echo "Installation is complete. Navigate to Server IP"
	echo "================================================="
fi
