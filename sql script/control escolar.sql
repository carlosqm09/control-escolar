-- Active: 1652709766677@@127.0.0.1@3306@control_escolar

CREATE TABLE alumno(
    idalumno            INT            AUTO_INCREMENT,
    matricula           VARCHAR(15)    NOT NULL,
    nombre              VARCHAR(20)    NOT NULL,
    primer_apellido     VARCHAR(20)    NOT NULL,
    segundo_apellido    VARCHAR(20)    NOT NULL,
    email               VARCHAR(30)    NOT NULL,
    dtcreacion          DATETIME       NOT NULL DEFAULT NOW(),
    dtmodificacion      DATETIME       NOT NULL,
    activo              INT            NOT NULL,
    PRIMARY KEY (idalumno)
)ENGINE=MYISAM
;



-- 
-- TABLE: asignatura 
--

CREATE TABLE asignatura(
    idasignatura      INT             NOT NULL,
    clave             VARCHAR(10)     NOT NULL,
    nombre            VARCHAR(30)     NOT NULL,
    observaciones     VARCHAR(200)    NOT NULL,
    creditos          INT             NOT NULL,
    dtcreacion        DATETIME        NOT NULL,
    dtmodificacion    DATETIME        NOT NULL,
    activo            INT             NOT NULL,
    idprofesor        INT             NOT NULL,
    PRIMARY KEY (idasignatura)
)ENGINE=MYISAM
;



-- 
-- TABLE: carrera 
--

CREATE TABLE carrera(
    idcarrera         INT            AUTO_INCREMENT,
    clave             VARCHAR(10)    NOT NULL,
    nombre            VARCHAR(30)    NOT NULL,
    no_semestres      INT            NOT NULL,
    dtcreacion        DATETIME       NOT NULL,
    dtmodificacion    DATETIME       NOT NULL,
    activo            INT            NOT NULL,
    PRIMARY KEY (idcarrera)
)ENGINE=MYISAM
;



-- 
-- TABLE: grupo 
--

CREATE TABLE grupo(
    idgrupo           INT            AUTO_INCREMENT,
    clave             VARCHAR(10)    NOT NULL,
    nombre            VARCHAR(20)    NOT NULL,
    capacidad         INT            NOT NULL,
    turno             VARCHAR(15)    NOT NULL,
    dtcreacion        DATETIME       NOT NULL,
    dtmodificacion    DATETIME       NOT NULL,
    activo            INT            NOT NULL,
    idprofesor        INT            NOT NULL,
    PRIMARY KEY (idgrupo)
)ENGINE=MYISAM
;



-- 
-- TABLE: horario_alumno 
--

CREATE TABLE horario_alumno(
    idhorario         INT            AUTO_INCREMENT,
    idasignatura      INT            NOT NULL,
    idgrupo           INT            NOT NULL,
    idsemestre        INT            NOT NULL,
    idalumno          INT            NOT NULL,
    dias_semana       VARCHAR(75)    NOT NULL,
    hora_inicio       DATETIME       NOT NULL,
    hora_fin          DATETIME       NOT NULL,
    aula              VARCHAR(20)    NOT NULL,
    dtcreacion        DATETIME       NOT NULL,
    dtmodificacion    DATETIME       NOT NULL,
    activo            INT            NOT NULL,
    PRIMARY KEY (idhorario, idasignatura, idgrupo, idsemestre, idalumno)
)ENGINE=MYISAM
;



-- 
-- TABLE: profesor 
--

CREATE TABLE profesor(
    idprofesor          INT            AUTO_INCREMENT,
    cedula              VARCHAR(30)    NOT NULL,
    nombre              VARCHAR(20)    NOT NULL,
    primer_apellido     VARCHAR(20)    NOT NULL,
    segundo_apellido    VARCHAR(20)    NOT NULL,
    email               VARCHAR(30)    NOT NULL,
    dtcreacion          DATETIME       NOT NULL,
    dtmodificacion      DATETIME       NOT NULL,
    activo              INT            NOT NULL,
    PRIMARY KEY (idprofesor)
)ENGINE=MYISAM
;



-- 
-- TABLE: semestre 
--

CREATE TABLE semestre(
    idsemestre        INT            AUTO_INCREMENT,
    clave             VARCHAR(10)    NOT NULL,
    semestre          VARCHAR(10),
    dtinicio          DATETIME       NOT NULL,
    dtfin             DATETIME       NOT NULL,
    dtcreacion        DATETIME       NOT NULL,
    dtmodificacion    DATETIME       NOT NULL,
    activo            INT            NOT NULL,
    idcarrera         INT            NOT NULL,
    PRIMARY KEY (idsemestre)
)ENGINE=MYISAM
;



-- 
-- TABLE: asignatura 
--

ALTER TABLE asignatura ADD CONSTRAINT Refprofesor30 
    FOREIGN KEY (idprofesor)
    REFERENCES profesor(idprofesor)
;


-- 
-- TABLE: grupo 
--

ALTER TABLE grupo ADD CONSTRAINT Refprofesor31 
    FOREIGN KEY (idprofesor)
    REFERENCES profesor(idprofesor)
;


-- 
-- TABLE: horario_alumno 
--

ALTER TABLE horario_alumno ADD CONSTRAINT Refasignatura23 
    FOREIGN KEY (idasignatura)
    REFERENCES asignatura(idasignatura)
;

ALTER TABLE horario_alumno ADD CONSTRAINT Refgrupo24 
    FOREIGN KEY (idgrupo)
    REFERENCES grupo(idgrupo)
;

ALTER TABLE horario_alumno ADD CONSTRAINT Refsemestre25 
    FOREIGN KEY (idsemestre)
    REFERENCES semestre(idsemestre)
;

ALTER TABLE horario_alumno ADD CONSTRAINT Refalumno26 
    FOREIGN KEY (idalumno)
    REFERENCES alumno(idalumno)
;


-- 
-- TABLE: semestre 
--

ALTER TABLE semestre ADD CONSTRAINT Refcarrera29 
    FOREIGN KEY (idcarrera)
    REFERENCES carrera(idcarrera)
;


