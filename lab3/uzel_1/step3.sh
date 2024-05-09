export BACKUPDIR=$HOME/backup_dir
rm -rf BACKUPDIR
mkdir BACKUPDIR
tar -xvf $HOME/backup/step3/base.tar -C BACKUPDIR
mkdir $PGDATA/pg_wal/
cp -r BACKUPDIR/pg_wal/* $PGDATA/pg_wal/
pg_ctl start



