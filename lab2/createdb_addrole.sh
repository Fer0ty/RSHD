mkdir -p /var/db/postgres0/ycv6
mkdir -p /var/db/postgres0/hxb42

psql -h localhost -p 9143 -c "CREATE TABLESPACE ycv6 LOCATION '/var/db/postgres0/ycv6';"
psql -h localhost -p 9143  -c "CREATE TABLESPACE hxb42 LOCATION '/var/db/postgres0/hxb42';"
psql -h localhost -p 9143  -c "CREATE DATABASE busyyellowuser TEMPLATE template1;"
psql -h localhost -p 9143  -c "CREATE ROLE test_role LOGIN;"
psql -h localhost -p 9143  -c "GRANT ALL PRIVILEGES ON DATABASE busyyellowuser TO test_role;"
psql -h localhost -p 9143  -c "GRANT ALL PRIVILEGES ON TABLESPACE ycv6 TO test_role;"
psql -h localhost -p 9143  -c "GRANT ALL PRIVILEGES ON TABLESPACE hxb42 TO test_role;"

#psql -h localhost -p 9143