# создание
mkdir -p $PGDATA
initdb -D $PGDATA --encoding=UTF8 --locale=ru_RU.UTF-8
sleep 3

# настройка
rm $PGDATA/postgresql.conf
cp config/postgresql.conf $PGDATA/postgresql.conf
echo "host                all   all             0.0.0.0/0           md5" >> $PGDATA/pg_hba.conf

# запуск
pg_ctl -D $PGDATA -l $PGDATA/start_serverlog.log start
sleep 3

psql -h localhost -p 9143 -f sql/init.sql
psql -h localhost -p 9143 -d firstdb -f sql/create_table.sql
psql -h localhost -p 9143 -d firstdb -f sql/create_role.sql
#psql -h localhost -p 9143 -d firstdb -U stepa -f sql/insert.sql

