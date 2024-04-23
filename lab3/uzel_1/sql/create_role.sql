create role stepa_role;
GRANT ALL PRIVILEGES ON DATABASE firstdb TO stepa_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO stepa_role;
GRANT ALL PRIVILEGES ON TABLE orders TO stepa_role;

create user stepa;
grant stepa_role to stepa;

CREATE USER backup_user WITH REPLICATION;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO backup_user;
GRANT ALL PRIVILEGES ON TABLE orders TO backup_user;
GRANT ALL PRIVILEGES ON DATABASE firstdb TO backup_user;