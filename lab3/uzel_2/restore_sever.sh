#Синтаксис
# pg_restore [параметры для подключения] [параметры восстановления] [дамп базы данных]

#Параметры для подключения
#
#-h [name] или --host=[name]: имя сервера. По умолчанию host = PGHOST.
#-p [port] или --port=[port]: порт. По умолчанию port = PGPORT.
#-U [name] или --username=[name]: имя пользователя.
#-w или --no-password: отключаем запрос пароля.
#-W или --password: принудительно включаем запрос пароля.
#--role=[name]: задаем имя роли.

#Параметры восстановления
#
#-a или --data-only: восстанавливаем только данные.
#-c или --clean: удаляем одноименные объекты перед восстановлением.
#-C или --create: создаем БД перед восстановлением.
#-d [name] или --dbname=[name]: подключаемся к [name] БД и восстанавливаем данные в неё.
#-e или --exit-on-error: завершаем восстановление в случае ошибки.
#-j [count] или --jobs=[count]: осуществляем восстановление в многопоточном режиме ([count]=количество потоков)
#-n [schema] или --schema=[schema]: восстанавливаем объекты только этой схемы.
#-N [schema] или --exclude-schema=[schema]: не восстанавливаем объекты этой схемы.
#-O или --no-owner: не восстанавливаем права на владение объектами.
#-s или --schema-only: восстанавливаем только схему
#-t таблица или --table=таблица: восстанавливаем только указанную таблицу.
#-x или --no-privileges или --no-acl: не восстанавливаем права доступа.

cd $PGDATA
pg_restore -h localhost -c -C -d seconddb $HOME/backup/firstdb # не работает, см. ТОДО в uzel_1/create_backup.sh