
#!/bin/bash
# ./createdb testdb testuser secretpass
# script retrieved from http://jetpackweb.com/

EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`
 
Q1="CREATE DATABASE IF NOT EXISTS $1;"
Q2="GRANT ALL ON *.* TO '$2'@'localhost' IDENTIFIED BY '$3';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
 
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser dbpass"
  exit $E_BADARGS
fi
 
$MYSQL -uroot -pmysqlPassword -e "$SQL"

