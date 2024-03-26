echo "CREATE TABLE test_table1 (" >> insertycv6.sql
echo "    id SERIAL PRIMARY KEY," >> insertycv6.sql
echo "    name VARCHAR(100)" >> insertycv6.sql
echo ")TABLESPACE ycv6;" >> insertycv6.sql
echo "INSERT INTO test_table1 (name) VALUES ('test_name');" >> insertycv6.sql

echo "CREATE TABLE test_table2 (" >> inserthxb42.sql
echo "    id SERIAL PRIMARY KEY," >> inserthxb42.sql
echo "    name VARCHAR(100)" >> inserthxb42.sql
echo ")TABLESPACE hxb42;" >> inserthxb42.sql
echo "INSERT INTO test_table2 (name) VALUES ('test_name');" >> inserthxb42.sql

