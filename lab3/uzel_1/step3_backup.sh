export BACKUP=$HOME/backup_dir
rm -rf $HOME/backup/step3
pg_basebackup -P -Ft -p 9143 -U backup_user -X fetch -D $HOME/backup/step3