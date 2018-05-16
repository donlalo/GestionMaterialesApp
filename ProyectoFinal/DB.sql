--------------------------------------------------------------------
ULTIMA ACTUALIZACION DB
----------------------------------------------------------------------
create table categorias(
id int auto_increment primary key,
nombre varchar(200) not null,
descripcion varchar(200),
fecCreacion datetime not null,
fecActualizacion datetime not null
);

create table articulos(
codigo varchar(250) primary key not null,
nombre varchar(50) not null,
descripcion varchar(200),
marca varchar(200) not null,
cantidad int not null,
fecCreacion datetime not null,
fecActualizacion datetime not null,
idCategoria int,
foreign key (idCategoria) references categorias(id)
);

create table prestamos(
id int auto_increment primary key,
codigoArticulo varchar(250) not null,
cantidad int not null,
responsable varchar(250),
sala varchar(50),
jornada varchar(50),
fecha datetime not null,
devuelto varchar(2),
foreign key (codigoArticulo) references articulos(codigo)
); 

create table usuarios(
id int auto_increment primary key,
usuario varchar(50) not null,
pass varchar(255) not null,
fecCreacion datetime not null,
fecActualizacion datetime not null
);

---------------------------------------------
PROCEDURES 
---------------------------------------------
/* verifica existencia de usuario */ 
delimiter //
create procedure usuarios_check(_usuario varchar(250), _pass varchar(250))
begin
declare resultado tinyint;
if exists (select * from usuarios where usuario = _usuario and pass = _pass) then
set resultado = 1;
else
set resultado = 0;
end if;
select resultado;
end
//
/* Lista Todas Las Categorias*/
delimiter //
create procedure categorias_listar(_limit int(3))
begin
select id, nombre, descripcion, fecCreacion, fecActualizacion from categorias limit _limit;
end
//

delimiter //
create procedure categorias_crear(_nombre varchar(50), __descripcion varchar(250))
begin
insert into categorias (id,nombre,descripcion,fecCreacion,fecActualizacion) values (null,_nombre,__descripcion,now(),now());
end
//