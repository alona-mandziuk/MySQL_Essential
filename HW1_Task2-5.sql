/*Task 1. Створити БВ з назвою “MyDB”*/

create database MyDB;
/*Task 2. В створеній БВ створити 3 таблиці: 
1-а містить імена та номера телефонів працівників певної компанії, 
2-а містить інформацію про їхню зарплату та посади, 
3-я містить інформацію про сімейне положення, дату народження та місце проживання.*/

#таблиця 1 (Імена та номера телефонів працівників компанії)
use MyDB;

drop table PersonalInfo;

create table NamesAndPhone (
id int auto_increment not null,
name varchar (30) not null,
phone varchar(15) not null,
primary key (id)
);

insert into NamesAndPhone
(name, phone)
values
('John Doe', '+12359887465'),
('Jane Smith', '+1335468468'),
('Fred Wilkirson', '+36555454654684');
select * from NamesAndPhone;

#таблиця 2 (Відомість по зарплаті та посадах)
create table Salary (
id int auto_increment not null,
salary int,
position varchar (50) not null,
primary key (id)
);

insert into Salary 
(salary, position)
values
(12000, 'seller'),
(20000, 'manager'),
(8000, 'junior seller');
select * from Salary;

#таблиця 3 (сімейне положення, дата народження, місце проживання)

create table PersonalInfo (
id int auto_increment not null,
marital_status varchar (20),
birth_date date,
adress varchar (100),
primary key (id)
);

insert into PersonalInfo
(birth_date, marital_status, adress)
values
('1985-10-10', 'unmarried', '30258 Flowers highway 5/10'),
('1990-03-25', 'unmarried', '56554 Happiness street 95/235'),
('1996-08-13', 'unmarried', '78415 Sunnyday street 105');
select * from PersonalInfo;

/*Task 3. З попереднього завдання, таблиця 2 отримати id працівників, зарплата яких більше 10000. */

select id from Salary where salary > 10000;

/*Task 4. З попереднього завдання працівник по id 1 був не одружений, одружився; змінити дані в 3 таблиці про сімейне положення*/

update PersonalInfo
set marital_status = 'married'
where id = 1;


