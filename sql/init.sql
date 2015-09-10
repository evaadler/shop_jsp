drop database if exists nina_shop;
create database nina_shop;
use nina_shop;
create table if not exists t_user(
	id int(10) primary key auto_increment,
	username varchar(100),
	password varchar(100),
	nickname varchar(100)
);

grant all on nina_shop.* to 'root'@'localhost' identified by '123'


select * from t_user