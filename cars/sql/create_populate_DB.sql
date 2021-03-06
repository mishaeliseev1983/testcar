



CREATE USER test_user_postrgres WITH password 'test_user_postrgres';

CREATE DATABASE carowner
  WITH OWNER = test_user_postrgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Russian_Russia.1251'
       LC_CTYPE = 'Russian_Russia.1251'
       CONNECTION LIMIT = -1;


CREATE ROLE
GRANT ALL privileges ON DATABASE carowner TO test_user_postrgres;
GRANT

\c carowner

DROP TABLE IF EXISTS public.city;
DROP TABLE IF EXISTS public.owner;
DROP TABLE IF EXISTS public.car;
DROP SEQUENCE IF EXISTS public.global_seq;

CREATE SEQUENCE  public.global_seq START 44;

CREATE TABLE public.city
(
  id integer NOT NULL DEFAULT nextval('global_seq'::regclass),
  name character varying NOT NULL,
  CONSTRAINT city_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  public.city
  OWNER TO test_user_postrgres;
  
  
CREATE TABLE public.owner
(
  id integer NOT NULL DEFAULT nextval('global_seq'::regclass),
  name character varying NOT NULL,
  surname character varying NOT NULL,
  patronymic character varying NOT NULL,
  id_city integer NOT NULL,
  CONSTRAINT owner_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.owner
  OWNER TO test_user_postrgres;

  
CREATE TABLE public.car
(
  id integer NOT NULL DEFAULT nextval('global_seq'::regclass),
  "number" character varying NOT NULL,
  model character varying,
  id_owner integer NOT NULL,
  CONSTRAINT car_pkey PRIMARY KEY (id),
  CONSTRAINT car_id_owner_fkey FOREIGN KEY (id_owner)
      REFERENCES public.owner (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.car
  OWNER TO test_user_postrgres;
  
  

CREATE TABLE public.users
(
  id integer NOT NULL,
  username character varying NOT NULL,
  password character varying NOT NULL,
  CONSTRAINT id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.users
  OWNER TO test_user_postrgres;



delete from city;
delete from car;
delete from owner;
delete from users;

ALTER SEQUENCE global_seq RESTART WITH 44;

INSERT INTO city (name)VALUES ('�����');
INSERT INTO city (name)VALUES ('������');
INSERT INTO city (name)VALUES ('�������');
INSERT INTO city (name)VALUES ('�������');
INSERT INTO city (name)VALUES ('�����������');
INSERT INTO city (name)VALUES ('������������');
INSERT INTO city (name)VALUES ('������');
INSERT INTO city (name)VALUES ('������');
INSERT INTO city (name)VALUES ('��������');
INSERT INTO city (name)VALUES ('����');
INSERT INTO city (name)VALUES ('�������������');


INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('������', '������', '���������' , 44);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('������', '�������', '���������' , 45);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('������', '���', '����������' , 46);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('������', '�����', '���������' , 47);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('������', '�����', '���������' , 48);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('������', '�������', '���������' , 49);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('�����', '�����', '���������' , 50);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('�����', '������', '����������' , 51);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('�����', '�����', '���������' , 51);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('����������', '���������', '���������' , 51);
INSERT INTO owner (name, surname, patronymic, id_city) VALUES ('������', '���', '���������' , 51);



INSERT INTO car (number, model, id_owner) VALUES ('�136X�', 'KIA CEED', 55);
INSERT INTO car (number, model, id_owner) VALUES ('�246��', 'KIA RIO', 58);
INSERT INTO car (number, model, id_owner) VALUES ('�356�X', 'BMW X3', 59);
INSERT INTO car (number, model, id_owner) VALUES ('�466��', 'LADA PRIORA', 57);
INSERT INTO car (number, model, id_owner) VALUES ('�576��', 'LADA GRANTA', 55);
INSERT INTO car (number, model, id_owner) VALUES ('T686��', 'VW POLO', 56);
INSERT INTO car (number, model, id_owner) VALUES ('T496��', 'VW JETTA', 56);
INSERT INTO car (number, model, id_owner) VALUES ('�556T�', 'NISSAN TEANA', 56);
INSERT INTO car (number, model, id_owner) VALUES ('�466�X', 'AUDI A6', 64);
INSERT INTO car (number, model, id_owner) VALUES ('�663XX', 'MAZDA CX-5', 62);
INSERT INTO car (number, model, id_owner) VALUES ('�116T�', 'KIA CEED', 63);
INSERT INTO car (number, model, id_owner) VALUES ('�456X�', 'KIA CEED', 60);


INSERT INTO users (id, username, password) VALUES (1, 'u1', 'u1');
INSERT INTO users (id, username, password) VALUES (2, 'u', 'u');
INSERT INTO users (id, username, password) VALUES (3, 'q', 'q');
INSERT INTO users (id, username, password) VALUES (4, 'u4', 'u4');
INSERT INTO users (id, username, password) VALUES (5, 'u5', 'u5');
INSERT INTO users (id, username, password) VALUES (6, 'u6', 'u6');
INSERT INTO users (id, username, password) VALUES (7, 'u7', 'u7');
INSERT INTO users (id, username, password) VALUES (8, 'u8', 'u8');
INSERT INTO users (id, username, password) VALUES (9, 'u9', 'u9');
INSERT INTO users (id, username, password) VALUES (10, 'u10', 'u10');

COMMIT;