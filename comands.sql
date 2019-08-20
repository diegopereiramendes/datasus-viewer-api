create database datasus;

CREATE USER datasus_user WITH PASSWORD '12345';

GRANT ALL PRIVILEGES ON DATABASE "datasus" to datasus_user;

create table "group"
(
  id   bigserial not null
    constraint group_pkey
      primary key,
  name text      not null
);

create table role
(
  id          bigserial not null
    constraint role_pkey
      primary key,
  name        text      not null,
  description text
);

create table role_group
(
  role_id  bigint not null
    constraint role_group_role_id_fk
      references role,
  group_id bigint not null
    constraint role_group_group_id_fk
      references "group",
  constraint role_group_pk
    primary key (group_id, role_id)
);

create table "user"
(
  id         bigserial            not null
    constraint user_pkey
      primary key,
  name       text                 not null,
  password   text                 not null,
  active     boolean default true not null,
  email      text,
  username   text                 not null,
  id_unidade bigint               not null
);

create table group_user
(
  group_id bigint not null
    constraint group_user_group_group_id_fk
      references "group",
  user_id  bigint not null
    constraint group_user_user_id_fk
      references "user",
  constraint group_user_pk
    primary key (user_id, group_id)
);


INSERT INTO public."group" (id, name)
VALUES (1, 'ADMINISTRADOR');
INSERT INTO public."group" (id, name)
VALUES (2, 'USER');

INSERT INTO public."role" (id, name, description)
VALUES (2, 'ROLE_USER', 'Usuários em geral');
INSERT INTO public."role" (id, name, description)
VALUES (1, 'ROLE_ADMIN', 'Administradores em Geral');

INSERT INTO public."user" (id, name, password, active, email, username, id_unidade)
VALUES (1, 'Diego', '$2a$10$pDE360m8v2Asjfq1/bg1UesAVST10REHyufnx6QlRNpQbLaRtR3ua', true, 'dmendes@ma.sesc.com.br',
        'diego', 2);

INSERT INTO public."group_user" (group_id, user_id)
VALUES (1, 1);

INSERT INTO public."role_group" (role_id, group_id)
VALUES (1, 1);
