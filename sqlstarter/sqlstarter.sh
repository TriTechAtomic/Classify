sudo apt update ;
sudo apt install -y postgresql postgresql-client;
sudo pg_ctlcluster 12 main start;
cat ./passwd.txt | sudo passwd postgres;
sudo su -l postgres;
psql -c "CREATE USER parth WITH SUPERUSER PASSWORD 'xxparthparekhxx_420';";
psql -c "create database classify;";


