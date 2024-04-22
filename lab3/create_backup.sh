#Синтаксис
# pg_basebackup [параметры для подключения] [параметры создания резервной копии]

#Параметры для подключения:
#
#-d [connection string] или --dbname=[connection string]: задаем строку подключения.
#-h [name] или --host=[name]: имя сервера. По умолчанию host = PGHOST.
#-p [port] или --port=[port]: порт. По умолчанию port = PGPORT.
#-U [name] или --username=[name]: имя пользователя.

#Параметры создания резервной копии:
#
#-D [catalog] или --pgdata=[catalog]: каталог, каталог, куда сохраняем дамп.
#-F [format] или --format=[format]: формат дампа. Может иметь следующие значения:
  # p или plain: обычные файлы;
  # t или tar: формат .tar;
#-r [speed]или --max-rate=[speed]: задаем максимальную скорость передачи данных в Кб/с
#-Z [0..9] или --compress=[0..9]: выбираем уровня сжатия (0 - не сжимать, 9 - максимальный).

# Источник: https://timeweb.cloud/tutorials/postgresql/dampy-v-postgresql

# создание резервного копирования
mkdir -p $HOME/backup/firstdb
pg_basebackup -h localhost -U backup_user -D $HOME/backup/firstdb -F t -X none

# -F t: формат архивации в виде tar-файла
# -X stream: потоковая передача WAL-файлов (сохранится отдельный файл pg_wal.tar)
# -X none: отключит потоковую передачу WAL-файлов (pg_wal.tar не создастся)

