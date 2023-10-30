use master
create database Citas
use Citas

drop table if exists Usuarios
create table Usuarios(
    Id int auto_increment primary key,
    TipoDocumento char(2) not null,
    NumeroDocumento varchar(15) unique not null,
    Nombre1 varchar(25) not null,
    Nombre2 varchar(25),
    Nombre3 varchar(25),
    Apellido1 varchar(25) not null,
    Apellido2 varchar(25) not null,
)

drop table if exists Citas
create table Citas(
    Id int auto_increment primary key,
    FechaCita datetime not null,
    FechaAsignacion timestamp not null,
    IdUsuario int not null,
    foreign key IdUsuario references Usuarios(Id) on delete cascade
)

