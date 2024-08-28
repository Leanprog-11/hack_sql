create table countries(
  id_country serial primary key,
  name varchar(50) not null 
);

create table users(
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);

insert into countries (name) values ('argentina') , ('colombia'),('chile');
select * from countries;

insert into users (id_country, email, name) 
  values (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman'); 
  select * from users;
  
  delete from users where email = 'bar@bar.com'
  select * from users;
  
  update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
  select * from users;
  
  select * from users inner join  countries on users.id_country = countries.id_country;
  
  select u.id_users as id, u.email, u.name as fullname, c.name 
  from users u inner join  countries c on u.id_country = c.id_country;
  
create table priorities(
 id_priorities serial primary key
);

ALTER TABLE priorities
ADD COLUMN type_nombre VARCHAR (150);

create table contact_request(
 id_priority integer not null,
 id_country  integer not null,
 id_email serial primary key,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country),
 foreign key (id_priority) references priorities (id_priority) 
);
ALTER TABLE contact_request
  ADD COLUMN detail VARCHAR(255);
ALTER TABLE contact_request
ADD COLUMN physical_address VARCHAR(255);

insert into countries (name) values ('venezuela') , ('peru'),('EE.UU'), ('paraguay'), ('costa rica');
select * from countries;


insert into priorities (type_nombre) values ('high'), ('low'), ('half');
select * from priorities; 


insert into contact_request (id_country, id_priority, name, detail, physical_address) 
values (1, 2, 'Steven', 'Nuevo cliente', 'Caracas La candelaria'),
(4, 3, 'Jose', ' Cliente antiguo', ' Caracas Petare La planada'),
(5, 1, 'Estefania', 'Cliente mayorista', 'Barquisimeto Cabudare');
select * from contact_request; 

delete from contact_request where name = 'Steven';

update contact_request set name = 'Jose', detail = 'Nuevo cliente' where id_email = 2;