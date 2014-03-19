#!/bin/bash

sudo apt-get update

# Install Apache HTTP Server
sudo apt-get install apache2 -y

# Install PHP & MySQL
echo mysql-server mysql-server/root_password select "vagrant" | debconf-set-selections
echo mysql-server mysql-server/root_password_again select "vagrant" | debconf-set-selections
sudo apt-get install php5 libapache2-mod-php5 php5-gd mysql-server libapache2-mod-auth-mysql php5-mysql -y

# Enable mod_rewrite
sudo a2enmod rewrite

# Disable the default site
sudo a2dissite default

# Link and enable the processwire site (config)
sudo ln -s /vagrant/processwire /etc/apache2/sites-available/processwire
sudo a2ensite processwire

# Install Git and Processwire
cd /var/www
rm -rf *
sudo apt-get install git -y
git clone https://github.com/ryancramerdesign/ProcessWire .
mv site-default/ site/
chmod -R 777 site/assets/
chmod 777 site/config.php
mv htaccess.txt .htaccess

# Restart Apache
sudo apachectl restart

echo “Finished.  Browse to http://192.168.100.10/ to complete the CMS setup.”
echo “500 Errors? Check out http://processwire.com/talk/topic/2439-htaccess-issue/“
