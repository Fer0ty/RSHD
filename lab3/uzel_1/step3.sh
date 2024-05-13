export BACKUPDIR=$HOME/backup_dir
rm -rf BACKUPDIR
mkdir BACKUPDIR
cp -r $PGDATA/pg_wal/* $BACKUPDIR/pg_wal
rm -rf $PGDATA/pg_wal
mkdir $PGDATA/pg_wal/
cp -r BACKUPDIR/pg_wal/* $PGDATA/pg_wal/
pg_ctl start

pg_resetwal -f $PGDATA
