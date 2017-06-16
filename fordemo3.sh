#!/bin/bash


#проверяем не пустой ли параметр на входе

PROJECT_NAME=demo3
echo "New project is ${PROJECT_NAME}"


PROJECT_DIR_demo="/home/yanki/my/demo_y"
PROJECT_DIR_demo3="/home/yanki/my/${PROJECT_NAME}_y"

echo "New project DIR is ${PROJECT_DIR_demo3}"
#проверяем наличие домашней директории
if [ -d "${PROJECT_DIR_demo3}" ]; then
	echo "Directory ${PROJECT_DIR_demo3} is already exists!"
fi


#копируем базу
cp ${PROJECT_DIR_demo}/dumper/backup/*_2017-06-15_10-32.sql.gz ${PROJECT_DIR_demo3}/dumper/backup/
#копируем контент
cp -R ${PROJECT_DIR_demo}/content/ ${PROJECT_DIR_demo3}/

#установим права
chmod -R 0777 ${PROJECT_DIR_demo3}

#find ${PROJECT_DIR}/logs/php/ -name "*201?-php.php" -type f  -delete