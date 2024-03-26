./init_claster.sh
./config_claster.sh
./createdb.sh
psql -h localhost -p 9143 -d busyyellowuser -f create.sql
psql -h localhost -p 9143 -d busyyellowuser -f create_role.sql
psql -h localhost -p 9143 -d busyyellowuser -U test -f insert.sql


