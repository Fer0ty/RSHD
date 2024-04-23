#Синтаксис
#
#pg_dump [параметры для подключения] [параметры дампа] [имя БД*] > [каталог, куда необходимо сохранить backup postgres database]

#* Если не задать имя БД, то вместо него будет использоваться значение переменной окружения PGDATABASE. А если PGDATABASE не присвоено какое-либо значение, то pg_dump воспользуется именем пользователя, инициирующего утилиту.

#Параметры для подключения
#
#-d [name] или --dbname=[name]: имя БД. Равнозначно [имя базы данных].
#-h [name] или --host=[name]: имя сервера. По умолчанию host = PGHOST.
#-p [port] или --port=[port]: порт. По умолчанию port = PGPORT.
#-U [name] или --username=[name]: имя пользователя.

#Параметры создания резервной копии
#
#-F [format] или --format=[format]: формат дампа. В postgresql format может принимать следующие значения:
    #p или plain: SQL скрипт. Значение по умолчанию.
    #c или custom: архив.
    #d или directory: каталог.
    #t или tar: формат .tar
#-a или --data-only: сохраняем только данные. Например, при использовании этого параметра связи между таблицами не сохраняются.
#-b или --blobs: добавляем в дамп большие объекты. Этот параметр используется по умолчанию.
#-B или --no-blobs: не сохраняем большие объекты.
#-c или --clean: добавляем в скрипт команды DROP. Может понадобится при наличии объектов с одинаковыми именами. Применим только к SQL скриптам.
#-C или --create: добавляем в скрипт команды для создания БД и подключения к ней. Применимо только к SQL скриптам.
#-E кодировка или --encoding=кодировка: устанавливаем определенную кодировку дампа.
#-f [catalog] или --file=[catalog]: каталог, куда сохраняем дамп. Параметр равнозначен указанному в синтаксисе [каталог, куда необходимо сохранить дамп БД]
#-j [count] или --jobs=[count]: выполняем утилиту в многопоточном формате (количество потоков = [count]).
#-n [schema] или --schema=[schema]: сохраняем схемы, удовлетворяющие шаблону.
#-N [schema] или --exclude-schema=[schema]: не сохраняем схемы, удовлетворяющие шаблону.
#-o или --oids: сохраняем OID.
#-O или --no-owner: не добавляем в скрипт команды, связанные с установкой владельцев.
#-s или --schema-only: сохраняем только схемы.
#-t [schema] или --table=[schema]: сохранить таблицы, удовлетворяющие шаблону.
#-T [schema] или --exclude-table=[schema]: не сохраняем таблицы, удовлетворяющие шаблону.
#-x или --no-privileges или --no-acl: не сохраняем права доступа.
#-Z [0..9] или --compress=[0..9]: выбираем уровня сжатия (0 - не сжимать, 9 - максимальный).


# Источник: https://timeweb.cloud/tutorials/postgresql/dampy-v-postgresql

# создание резервного копирования
rm -rf $HOME/backup/firstdb
mkdir -p $HOME/backup/firstdb

# TODO: через cron забиндить генерацию бэкапов 2 раза в день:
#  ввести команду "crontab -e" и скопипастить это:
#0 2 pg_dump -h localhost -d firstdb -p 9143 -U backup_user -O -Fc > "$HOME/backup/firstdb_$(date +\%Y\%m\%d_\%H\%M).dump"
#0 14 pg_dump -h localhost -d firstdb -p 9143 -U backup_user -O -Fc > "$HOME/backup/firstdb_$(date +\%Y\%m\%d_\%H\%M).dump"

pg_dump -h localhost -d firstdb -p 9143 -U backup_user -O -Fc > "$HOME/backup/firstdb_$(date +\%Y\%m\%d_\%H\%M).dump"
# Отправка дампов на второй узел

rsync -avzP $HOME/backup/* postgres0@pg191:~/backup/
