create database starbucks;
use starbucks;

create table if not exists directory (
	brand varchar(20),
    store_number varchar(20),
    store_name varchar(100),
    ownership_type varchar(25),
    street_address varchar(100),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    postcode varchar(15),
    phone_number varchar(15),
    timezone varchar(100),
    longitude double,
    latitude double
);

drop table if exists directory;

show tables;
select * from directory;
