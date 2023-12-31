


//LEER IMPORTATE PRIMERO



CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "roles_id" int NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "rol" varchar(30) NOT NULL DEFAULT 1
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "category" varchar(30) NOT NULL
);

CREATE TABLE "course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "description" varchar(70) NOT NULL,
  "level" varchar(30) NOT NULL,
  "teacher" int NOT NULL
);

CREATE TABLE "course_video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "url" varchar NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "users_course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "users_id" int NOT NULL,
  "courses_id" int NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

ALTER TABLE "users_course" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_course" ADD FOREIGN KEY ("courses_id") REFERENCES "course" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("id") REFERENCES "categories" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("teacher") REFERENCES "users" ("id");


// IMPORTANTE

// ANTES DE GENERAR LAS RELACIONES CREAR PRIMERO LAS TABLES Y HACER LOS INSERTS YA QUE ME GENERO ERROR HASTA QUE NO LO HICE ASI

// comandos para usar en la base de datos

CREATE DATABASE entregable_1

// se realiza cambio a la base de datos

// \c entregable_1 

// despues de creada la base de datos se pueden usar los comandos que estan arriba

INSERT INTO roles (rol) VALUES ('student'), ('teacher'), ('admin');

INSERT INTO users (name, email, password, age, roles_id) VALUES ('nicolas', 'nicolas@gmail.com', 'nicolas1234', 22, 1), ('erica', 'erica@gmail.com', 'erica1234', 26, 1), ('alejandra', 'alejandra@academlo.com', 'alejandra1234', 28, 2), ('brenda', 'brenda@academlo.com', 'brenda1234', 30, 2), ('ian', 'ian@academlo.com', 'ian1234', 32, 2), ('erik', 'erik@academlo.com', 'erik1234', 36, 3), ('georg', 'georg@academlo.com', 'georg1234', 37, 3);

INSERT INTO categories (category) VALUES ('frontend'), ('backend');

INSERT INTO course_video (title, url, course_id) VALUES ('html', 'url1', 1), ('css', 'url2', 1), ('javascript', 'url3', 1), ('react', 'url4', 2), ('consumo de apis', 'url5', 2), ('ecommers con react', 'url6', 2), ('node js', 'url7', 3), ('base de datos', 'url8', 3);

INSERT INTO users_course (users_id, courses_id) VALUES (1, 1), (2, 1), (1, 2), (2, 2), (1, 3), (2, 3);

INSERT INTO course (id, title, description, level, teacher) VALUES (1, 'fundamentos', 'bases de programacion', 'facil(1)', 3), (2, 'react', 'creacion de aplicaciones', 'intermedio(2)', 4), (3, 'backend', 'base de datos y mas', 'dificil(3)', 5);



ADICIONAL AGREGO EL CODIGO DEL DBDIAGRAM POR SI ACA :v


Table users{
  id int [pk, increment]
  name varchar(30) [not null]
  email varchar [not null, unique]
  password varchar [not null]
  age int [not null]
  roles_id int [not null] 
}

table roles {
  id int [pk, increment]
  rol varchar(30) [not null, default: 1]
}

table categories {
  id int [pk, increment]
  category varchar(30) [not null]
}

table course {
  id int [pk, increment]
  title varchar(30) [not null]
  description varchar(70) [not null]
  level varchar(30) [not null]
  teacher int [not null]
}

table course_video {
  id int [pk, increment]
  title varchar(30) [not null]
  url varchar [not null]
  course_id int [not null]
}

table users_course {
  id int [pk, increment]
  users_id int [not null]
  courses_id int [not null]
}


Ref: "roles"."id" < "users"."roles_id"

Ref: "users"."id" < "users_course"."users_id"

Ref: "course"."id" < "users_course"."courses_id"

Ref: "course"."id" < "course_video"."course_id"

Ref: "categories"."id" < "course"."id"

Ref: "users"."id" < "course"."teacher"



