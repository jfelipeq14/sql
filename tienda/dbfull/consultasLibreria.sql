create database libreria;

use libreria;

drop table if exists libros;

create table libros(
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
);

 insert into libros(titulo,autor,editorial,precio) 
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros(titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',10.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',10.00);
  
 -- Obtenemos el título, precio de un libro específico y la diferencia entre
 -- su precio y el máximo valor:
 select titulo,precio,
  precio-(select max(precio) from libros) as diferencia
  from libros
  where titulo='Uno';  
  
  -- Mostramos el título y precio del libro más costoso:
 select titulo,autor, precio
  from libros
  where precio=
   (select max(precio) from libros);
   
   
drop table if exists editoriales;
 drop table if exists libros;

 create table editoriales(
  codigo int auto_increment,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  primary key(codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial) values('Uno','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Ilusiones','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',4);
 insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',2);
 insert into libros(titulo,autor,codigoeditorial) values('Puente al infinito','Richard Bach',2);
 
 
 -- nombre de las editoriales que han publicado libros del autor "Richard Bach":
 select nombre
  from editoriales
  where codigo in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');
     
-- probamos la subconsulta separada de la consulta exterior para verificar que retorna
-- una lista de valores de un solo campo:
 select codigoeditorial
  from libros
  where autor='Richard Bach';
  
-- podemos reemplazar por un "join" la primera consulta:
 select distinct nombre
  from editoriales as e
  join libros
  on codigoeditorial=e.codigo
  where autor='Richard Bach';
  
-- buscar las editoriales que no han publicado libros de "Richard Bach":
 select nombre
  from editoriales
  where codigo not in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');
     
drop table if exists editoriales;
 drop table if exists libros;
 
 create table editoriales(
  codigo int auto_increment,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) values('Uno','Richard Bach',1,15);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Ilusiones','Richard Bach',4,18);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Puente al infinito','Richard Bach',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Aprenda PHP','Mario Molina',4,40);
 insert into libros(titulo,autor,codigoeditorial,precio) values('El aleph','Borges',2,10);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Antología','Borges',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Cervantes y el quijote','Borges',3,25);
   
   
select titulo
  from libros
  where autor like '%Borges%' and
  codigoeditorial = any
   (select e.codigo
    from editoriales as e
    join libros as l
    on codigoeditorial=e.codigo
    where l.autor like '%Bach%');
   
