create table empleados(
	id integer,
	nombre varchar(20),
	password varchar(20),
	primary key (id)
);

create table tipo_productos(
	id integer,
	id_empleado integer,
	descripcion varchar(20),
	primary key (id),
	foreign key (id_empleado) references empleados(id)
);

create table productos(
	id integer,
	id_producto integer,
	nombre varchar(60),
	precio real,
	fecha_salida date,
	imagen varchar(255),
	primary key (id),
	foreign key (id_producto) references tipo_productos(id)
);

insert into empleados values(1, 'Ismael', '1234');

insert into tipo_productos values(1, 1, 'Procesador');
insert into tipo_productos values(2, 1, 'Tarjeta grafica');
insert into tipo_productos values(3, 1, 'Memoria RAM');

insert into productos values(1, 1, 'AMD FX 8350', 130.40, '2012-12-29', 'https://images-na.ssl-images-amazon.com/images/I/41OmFJWZ6zL._SX425_.jpg');
insert into productos values(2, 1, 'INTEL I7-9900K', 539.90, '2018-10-1', 'https://www.aussar.es/31767-large_default/intel-core-i7-8700-32ghz-box.jpg');

insert into productos values(3, 2, 'RADEON RX 480 NITRO 8GB', 230.80, '2016-07-04', 'https://img.pccomponentes.com/articles/10/102724/sapphire-radeon-nitro-plus-rx-480-8gb-gddr5-4.jpg');
insert into productos values(4, 2, 'MSI GeForce GTX 1050Ti 4GT OC 4GB GDDR5', 174,90, null, 'https://img.pccomponentes.com/articles/10/107797/1111.jpg'); 

insert into productos values(5, 3, 'G.Skill Ripjaws V', 99.60, null, 'https://img.pccomponentes.com/articles/8/85974/g-skill-ripjaws-5-red-ddr4-2133-pc4-17000-8gb-2x4gb-cl15.jpg');
insert into productos values(6, 3, 'Corsair Vengeance', 115.16, null, 'https://img.ebyrcdn.net/732307-739888-800.jpg');
insert into productos values(7, 3, 'G.Skill Aegis DDR4 2133 PC4-17000 4GB CL15', 29, null, 'https://thumb.pccomponentes.com/w-530-530/articles/9/92712/g-skill-aegis-ddr4-2133-pc4-17000-4gb-1x4gb-cl15.jpg');