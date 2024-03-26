# создание
initdb -E KOI8-R --locale=ru_RU.KOI8-R

# настройка
echo "listen_addresses = '*'" >> $PGDATA/postgresql.conf
echo "port = $PGPORT" >> $PGDATA/postgresql.conf

echo "unix_socket_directories = ''" >> $PGDATA/postgresql.conf

echo "max_connections = 10" >> $PGDATA/postgresql.conf
echo "shared_buffers = 2GB" >> $PGDATA/postgresql.conf
echo "temp_buffers = 32MB" >> $PGDATA/postgresql.conf
echo "work_mem = 16MB" >> $PGDATA/postgresql.conf
echo "checkpoint_timeout = 15min" >> $PGDATA/postgresql.conf
echo "effective_cache_size = 4GB" >> $PGDATA/postgresql.conf
echo "fsync = on" >> $PGDATA/postgresql.conf
echo "commit_delay = 1000" >> $PGDATA/postgresql.conf

echo "wal_level = replica" >> $PGDATA/postgresql.conf

echo "log_directory = 'logs'" >> $PGDATA/postgresql.conf
echo "log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'" >> $PGDATA/postgresql.conf

echo "log_min_messages = ERROR" >> $PGDATA/postgresql.conf
echo "log_connections = on" >> $PGDATA/postgresql.conf
echo "log_checkpoints = on" >> $PGDATA/postgresql.conf

# запуск
pg_ctl -D $PGDATA -l $PGDATA/start_serverlog.log start





