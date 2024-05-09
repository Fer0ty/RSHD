pg_restore -h localhost -p 9143 -d firstdb -x -c $HOME/backup/firstdb_20240510_0052.dump
psql -h localhost -p 9143 -d firstdb
