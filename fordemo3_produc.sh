#!/bin/bash


#проверяем не пустой ли параметр на входе

PROJECT_NAME=demo3
echo "New project is ${PROJECT_NAME}"


PROJECT_DIR_backup="/var/www/demo3.horoshop.com.ua/backups/"
PROJECT_DIR_demo3="/var/www/${PROJECT_NAME}.horoshop.com.ua"

echo "New project DIR is ${PROJECT_DIR_demo3}"
#проверяем наличие домашней директории
if [ -d "${PROJECT_DIR_demo3}" ]; then
	echo "Directory ${PROJECT_DIR_demo3} is already exists!"
fi


#копируем базу
cp ${PROJECT_DIR_backup}/backups/dumper/backup/demohome3_*.sql.gz ${PROJECT_DIR_demo3}/dumper/backup/
#копируем контент
cp -R ${PROJECT_DIR_backup}/backups/content/ ${PROJECT_DIR_demo3}/

#установим права
chmod -R 0777 ${PROJECT_DIR_demo3}/content/
chmod -R 0777 ${PROJECT_DIR_demo3}/dumper/

#восстанавливаем БД
#mysql -u u_demo3 -p 4odcKUOd < demohome3_2017-06-16_11-32.sql.gz
#find ${PROJECT_DIR}/logs/php/ -name "*201?-php.php" -type f  -delete


#делаем дамп/ресторе
#mysqldump --user=root --password=nCzALHXOa2 $SUB_DOMAIN_NAME > /home/projects/project_name/db_backup/<PROJECT_NAME>_last.sql
#mysql -u root -p Tutorials < tut_backup.sql