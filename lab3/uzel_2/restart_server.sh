cd $HOME/lab3
pg_ctl -D $PGDATA stop

rm -rf $PGDATA

./main.sh