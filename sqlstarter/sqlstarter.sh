sudo apt update ;
sudo apt install -y postgresql postgresql-client;
sudo pg_ctlcluster 12 main start;
psql -c "CREATE USER parth WITH SUPERUSER PASSWORD 'xxparthparekhxx_420';";
psql -c "create database classify;";


