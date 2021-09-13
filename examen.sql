-- cremaos la base de datoa
CREATE DATABASE examen

-- seleccionamos la db
USE examen

-- creamos las tablas
CREATE TABLE usuarios(
    id_usuarios INT PRIMARY KEY,
    nombre VARCHAR(255) not null,
    direccion VARCHAR(255),
    telefono VARCHAR(15) not NULL
)

create table comentarios(
    id_comentarios INT PRIMARY KEY,
    nombre VARCHAR(255) not null,
    fecha DATE not null,
    descripcion VARCHAR(510) not null,
    id_libro INT not null
)

CREATE TABLE editoriales(
    id_editoriales int PRIMARY KEY ,
    nombre VARCHAR(255) not null,
    pais VARCHAR(100) not null,
    telefono VARCHAR(15) not null
)

create table autores(
    id_autores int PRIMARY KEY,
    nombre VARCHAR(255) not null,
    pais VARCHAR(100) not null,
    fecha_nacimiento date not null
)

CREATE TABLE categorias(
    id_categorias int PRIMARY KEY,
    nombre VARCHAR(255) not null,
    descripcion VARCHAR(510) not null
)

CREATE TABLE libros(
    id_libros INT PRIMARY KEY,
    titulo VARCHAR(255),
    id_autores INT,
    id_editoriales INT,
    id_usuarios INT,
    id_categorias INT,
    fecha DATE,
    descripcion VARCHAR(510),
    fecha_publicacion DATE,
    edicion VARCHAR(255),
    numero_vistas INT
)

-- creamos las llaves foraneas
ALTER TABLE libros ADD FOREIGN KEY(id_autores) REFERENCES autores(id_autores)
ALTER TABLE libros ADD FOREIGN KEY(id_editoriales) REFERENCES editoriales(id_editoriales);
ALTER TABLE libros ADD FOREIGN KEY(id_usuarios) REFERENCES usuarios(id_usuarios);
ALTER TABLE libros ADD FOREIGN KEY(id_categorias) REFERENCES categorias(id_categorias);

ALTER TABLE comentarios ADD FOREIGN KEY(id_libro) REFERENCES libros(id_libros);

-- 1


-- 2
SELECT usuarios.nombre, libros.titulo, libros.numero_vistas FROM usuarios JOIN libros ON usuarios.id_usuarios=libros.id_usuarios

-- 3
SELECT titulo FROM libros WHERE id_usuarios=7

-- 4
SELECT titulo FROM libros WHERE id_editoriales=2

-- 5
SELECT libros.titulo FROM libros JOIN editoriales on libros.id_editoriales= editoriales.id_editoriales WHERE editoriales.pais='mexico' AND libros.numero_vistas<500

-- 6

-- 7

-- 8
SELECT  titulo, COUNT(id_categorias) FROM libros GROUP BY titulo HAVING COUNT(id_categorias)>1

-- 9
select libros.titulo, COUNT(comentarios.id_comentarios) from libros JOIN comentarios on libros.id_libros=comentarios.id_libro GROUP BY titulo

-- 10
select libros.titulo, COUNT(comentarios.id_comentarios) from libros JOIN comentarios on libros.id_libros=comentarios.id_libro GROUP BY titulo HAVING COUNT(comentarios.id_comentarios) >1