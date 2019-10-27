#!/bin/sh
set -e
if [ -f /app/petclinic/java-petclinic.jar ];then
    java -jar /app/petclinic/java-petclinic.jar -Ddatabse=mysql -Dspring.datasource.initialization-mode=always
    #-Dspring.profiles.active=mysql -Dspring.datasource.url=jdbc:mysql://$DATABASE_URL/petclinic -Dspring.datasource.username=$DATABASE_USER -Dspring.datasource.password=$DATABASE_PASSWORD 
# elif [[ "$1" = "bash" ]];then
#     exec "/bin/sh"
fi
exec "$@"

