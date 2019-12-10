create user credituser with encrypted password 'credituser';
create schema creditdb;
create schema customerdb;
create schema productdb;
grant all privileges on database  postgres to credituser;
GRANT ALL ON schema productdb TO credituser;
GRANT ALL ON schema customerdb TO credituser;
GRANT ALL ON schema creditdb TO credituser;
