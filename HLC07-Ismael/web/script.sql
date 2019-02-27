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
	nombre varchar(20),
	precio real,
	fecha_salida date,
	imagen varchar(10),
	primary key (id),
	foreign key (id_producto) references tipo_productos(id)
);

insert into empleados values(1, 'Ismael', '1234');

insert into tipo_productos values(1, 1, 'Procesador');
insert into tipo_productos values(2, 1, 'Tarjeta grafica');
insert into tipo_productos values(3, 1, 'Memoria RAM');

insert into productos values(1, 1, 'AMD FX 8350', 130.40, '2012-12-29', 'pro1.png');
insert into productos values(2, 1, 'INTEL I7-9900K', 539.90, '2018-10-1', 'pro2.png');
insert into productos values(3, 2, 'RADEON RX 480 NITRO 4GB', 230.80, '2016-07-04', 'graf1.png');
insert into productos values(4, 3, 'G.Skill Ripjaws V', 99.60, null, 'ram1.png');
insert into productos values(5, 3, 'Corsair Vengeance', 115.16, null, 'ram2.png');
