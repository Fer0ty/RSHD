# создание
initdb -E KOI8-R --locale=ru_RU.KOI8-R

# настройка
rm $PGDATA/postgresql.conf
cp config/postgresql.conf $PGDATA/postgresql.conf

# запуск
pg_ctl -D $PGDATA -l $PGDATA/start_serverlog.log start
sleep 3
mkdir -p /var/db/postgres0/ycv6
mkdir -p /var/db/postgres0/hxb42

psql -h localhost -p 9143 -f sql/init.sql
psql -h localhost -p 9143 -d busyyellowuser -f sql/create_table.sql
psql -h localhost -p 9143 -d busyyellowuser -f sql/create_role.sql
psql -h localhost -p 9143 -d busyyellowuser -U test -f sql/insert.sql
