-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-10-15 21:59:06.619

-- tables
-- Table: answer
CREATE TABLE answer (
    identifier int  NOT NULL COMMENT 'Almacena los datos de las respuestas al momento de hacer una consulta',
    moderator varchar(120)  NOT NULL COMMENT 'Contiene los datos de los moderadores responsables de atender las consultas',
    record datetime  NOT NULL COMMENT 'Contiene la respuesta de atención del asesor',
    moderator_identifier int  NOT NULL COMMENT 'identificador único y numérico para cada moderador ',
    date timestamp  NOT NULL COMMENT 'Contiene la fecha y hora en que se registra la respuesta a la consulta',
    query varchar(250)  NOT NULL COMMENT 'Almacena los datos que se registran al momento de hacer una consulta',
    CONSTRAINT answer_pk PRIMARY KEY (identifier)
) COMMENT 'Contiene los datos de las respuestas sobre la cual se realizan las consultas';

-- Table: consult
CREATE TABLE consult (
    identifier int  NOT NULL COMMENT 'identificador único y numérico para cada consulta',
    user varchar(120)  NOT NULL COMMENT 'Datos personales de los usuarios',
    query_content varchar(250)  NOT NULL COMMENT 'Dirigida sobre el ODS 9 o aplicativo ',
    date timestamp  NOT NULL COMMENT 'Contiene la fecha y hora en que se registra la consulta',
    record datetime  NOT NULL COMMENT 'Contiene las consultas de atención del asesor',
    users_identifier int  NOT NULL COMMENT 'identificador único y numérico de cada usuario',
    response_identifier int  NOT NULL COMMENT 'Contiene los datos de las respuestas sobre la cual se realizan las consultas',
    CONSTRAINT consult_pk PRIMARY KEY (identifier)
) COMMENT 'Almacena los datos que se registran al momento de hacer una consulta';

-- Table: moderator
CREATE TABLE moderator (
    identifier int  NOT NULL COMMENT 'identificador único y numérico para cada moderador ',
    area char(1)  NOT NULL COMMENT 'Página web I aplicativo ',
    name varchar(70)  NOT NULL COMMENT 'Nombre del moderador',
    lastname varchar(70)  NOT NULL COMMENT 'apellido del moderador',
    email varchar(120)  NOT NULL COMMENT 'Contiene el correo del moderador ',
    query_type char(1)  NOT NULL COMMENT 'Dirigida respecto al ODS 9 o aplicativo ',
    record datetime  NOT NULL COMMENT 'Fecha en que se registra los datos del moderador ',
    CONSTRAINT moderator_pk PRIMARY KEY (identifier)
) COMMENT 'Contiene los datos de los moderadores responsables de atender las consultas';

-- Table: user
CREATE TABLE user (
    identifier int  NOT NULL COMMENT 'identificador único y numérico de cada usuario',
    name varchar(70)  NOT NULL COMMENT 'Contiene los nombres del solicitante',
    lastname varchar(70)  NOT NULL COMMENT 'Contiene los apellidos del solicitante',
    sex char(1)  NOT NULL COMMENT '(M)para Masculino | (F) para Femenino',
    cellphone char(9)  NOT NULL COMMENT 'Numero de celular del solicitante ',
    email varchar(120)  NOT NULL COMMENT 'correo electrónico del solicitante',
    CONSTRAINT user_pk PRIMARY KEY (identifier)
) COMMENT 'Datos personales de los usuarios';

-- foreign keys
-- Reference: consulta_respuesta (table: consult)
ALTER TABLE consult ADD CONSTRAINT consulta_respuesta FOREIGN KEY consulta_respuesta (response_identifier)
    REFERENCES answer (identifier);

-- Reference: consulta_usuarios (table: consult)
ALTER TABLE consult ADD CONSTRAINT consulta_usuarios FOREIGN KEY consulta_usuarios (users_identifier)
    REFERENCES user (identifier);

-- Reference: respuesta_moderador (table: answer)
ALTER TABLE answer ADD CONSTRAINT respuesta_moderador FOREIGN KEY respuesta_moderador (moderator_identifier)
    REFERENCES moderator (identifier);

-- End of file.

