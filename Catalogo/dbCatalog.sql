use master
create database Catalogo
use Catalogo

drop table if exists Clientes
create table Clientes(
    Id char(12) primary key not null,
    Nombre varchar(60) not null,
    Telefono char(12) not null,
);

drop table if exists Empresas
create table Empresas(
    Id varchar(60) primary key not null,
    Nombre varchar(50) not null,
);

drop table if exists Pedidos
create table Pedidos(
    Id int auto_increment primary key not null,
    IdCliente char(12) not null,
    foreign key (IdCliente) references Clientes(Id)
);

drop table if exists Pagos
create table Pagos(
    Id int auto_increment primary key not null,
    Valor int not null,
    Abono int not null,
    IdPedido int not null,
    foreign key (IdPedido) references Pedidos(Id)
);

drop table if exists Catalogos
create table Catalogos(
    Id int auto_increment primary key not null,
    NumeroCampanha varchar(50) not null,
    FechaCampanha date not null,
    LimiteFechaPedido date not null,
    IdEmpresa int not null,
    foreign key (IdEmpresa) references Empresas(Id)
);

drop table if exists Productos
create table Productos(
    Id char(5) primary key not null,
    Nombre varchar(50) not null,
    Cantidad int not null,
    Precio int not null,
    IdCatalogo int not null,
    foreign key (IdCatalogo) references Catalogos(Id)
);

drop table if exists DetallesPedidosProductos
create table DetallesPedidosProductos(
    Id int auto_increment primary key not null,
    IdPedido int not null,
    IdProducto char(5) not null,
    Cantidad int not null,
    Precio int not null,
    foreign key (IdPedido) references Pedidos(Id),
    foreign key (IdProducto) references Productos(Id)
);