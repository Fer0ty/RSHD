cd $HOME/lab3
pg_ctl -D $PGDATA stop
sleep 2
rm -rf $PGDATA