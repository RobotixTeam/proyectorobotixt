drop database if exists emps;
create database emps;

use emps;
create table administrador (
    clave varchar(10) primary key,
    contraseña varchar(20),
    nombre varchar(20),
    puesto_escuela varchar(20)
);

create table alumno (
    numero_boleta varchar(10) primary key,
    nombre varchar(20),
    grupo varchar(20),
    especialidad varchar(20)
);

create table maestro (
    RFC varchar(10) primary key,
    nombre varchar(20),
    materia_impartida varchar(20),
    correo_electronico varchar(20)
);
create table computadora (
    id_computadora varchar(100) primary key,
    tipo_reporte varchar(100),
    descripcion varchar(100),
    salon varchar(100),
    fecha date,
    hora time,
    modelo varchar(100),
    clave_administrador varchar(10),
    RFC_maestro varchar(10),
    numero_boleta_alumno varchar(10),
    foreign key (clave_administrador) references administrador(clave),
    foreign key (RFC_maestro) references maestro(RFC),
    foreign key (numero_boleta_alumno) references alumno(numero_boleta)
);

select * from maestro;
select * from administrador;
select * from alumno;
select * from computadora;


