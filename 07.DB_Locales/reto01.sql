/*Reto 01 Sesion 7*/
create table if not exists movies (
	id int unsigned primary key,
    titulo varchar(100),
    generos varchar(150)
);

create table if not exists ratings (
	userid int,
    movieid int,
    rating int,
    time_stamp bigint,
    foreign key (userid) references users(id),
    foreign key (movieid) references movies(id)
);