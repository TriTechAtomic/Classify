sudo service mysql start;
cat ./passwd.txt |  sudo mysql 
cat ./secureinstaller.txt | while read line; do echo $line; done | sudo mysql_secure_installation