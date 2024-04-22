umask 001
chmod 776 $HOME/lab2 $HOME/lab2/*
cd $HOME/lab2
pg_ctl -D $PGDATA stop
sleep 2
rm -rf $PGDATA
sleep 1
./main.sh