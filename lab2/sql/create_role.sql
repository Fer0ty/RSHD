create role test_role;
GRANT ALL on sequence orders_order_id_seq to test_role;
GRANT ALL PRIVILEGES ON DATABASE busyyellowuser TO test_role;
GRANT ALL PRIVILEGES ON TABLESPACE ycv6 TO test_role;
GRANT ALL PRIVILEGES ON TABLESPACE hxb42 TO test_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO test_role;
GRANT ALL PRIVILEGES ON TABLE orders TO test_role;

create user test;
grant test_role to test;