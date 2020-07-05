

create table participante(
    codigo integer(7) primary key,
    nombre varchar(30) not null,
    apellido varchar(30) not null
);


create table estado(
    id integer(1) primary key auto_increment,
    nombre varchar(30) unique not null,
    descripcion text

);


create table materia(
    codigo integer(7) primary key,
    nombre varchar(50) not null
);


create table palabra_clave(
    id integer(3) primary key auto_increment,
    nombre varchar(20) unique not null,
    descripcion text
);

create table repositorio(
    id integer(6) primary key auto_increment,
    nombre varchar(100) unique not null,
    descripcion text,
    url varchar(30) unique,
    icono varchar(30),
    inicio date,
    fin date,
    estado integer(1) not null,
    CONSTRAINT repositorio_estado_fk foreign key (estado) references estado(id)

);

create table documentos(
    id integer(3),
    repositorio integer(6),
    nombre varchar(50),
    descripcion text,
    url varchar(30),
    CONSTRAINT documentos_repo_fk foreign key (repositorio) references repositorio(id),
    CONSTRAINT documentos_pk primary key (id, repositorio)

);

create table repo_palabra(
    palabra integer(3),
    repositorio integer(6),
    CONSTRAINT repo_palabra_palabra_fk foreign key (palabra) references palabra_clave(id),
    CONSTRAINT repo_palabra_repo_fk foreign key (repositorio) references repositorio(id),
    CONSTRAINT repo_palabra_pk primary key (palabra, repositorio)
);

create table repo_participante(
    participante integer(7),
    repositorio integer(6),
    CONSTRAINT repo_participante_participante_fk foreign key (participante) references participante(codigo),
    CONSTRAINT repo_participante_repo_fk foreign key (repositorio) references repositorio(id),
    CONSTRAINT repo_participante_pk primary key (participante, repositorio)
);

create table repo_materia(
    materia integer(7),
    repositorio integer(6),
    CONSTRAINT repo_materia_palabra_fk foreign key (materia) references materia(codigo),
    CONSTRAINT repo_materia_repo_fk foreign key (repositorio) references repositorio(id),
    CONSTRAINT repo_materia_pk primary key (materia, repositorio)
);




