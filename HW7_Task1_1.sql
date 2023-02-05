/*Створіть БВ з іменем "MyFunkDB"*/

create database MyFunkDB;
use MyFunkDB;

/*В даній БД створіть 3 таблиці:
в 1-й містяться імена та номера телефонів працівників компанії;
в 2-й - відомості про зарплату та посади: головний директор, менеджер, робочий;
в 3-й - інформація про сімейне положення, дату народження та місце проживання.*/

drop table Personnel; 
drop table Salary;
drop table Another_Info;

create table Personnel (
pers_ID int auto_increment not null primary key,
name varchar (30) not null,
surname varchar (30) not null,
phone varchar (13)
);

create index Personnel on Personnel (pers_ID);

create table Salary (
id int auto_increment not null primary key,
foreign key (id) references Personnel (pers_ID),
position varchar (40),
salary int
);

create table Another_Info (
id int auto_increment not null primary key,
foreign key (id) references Personnel (pers_ID),
birthdate date,
marital_status varchar (20),
city varchar (30),
adress varchar (50)
);

insert Personnel 
(name, surname, phone)
values
('Tony', 'Stark', '+100511235'),
('Bary', 'Allan', '+2377771651'),
('Thor', 'Odinson', '+11100115'),
('Diana', 'Prince', '+66666714'),
('Steven', 'Strange', '+00033333555');

insert Salary 
(position, salary)
values
('Head manager', 100000),
('Manager', 75000),
('Worker', 30000),
('Worker', 31000),
('Worker', 28500);

insert Another_Info 
(birthdate, marital_status, city, adress)
values
('1982-04-01', 'married', 'New York', 'Evergreen Terrace 20156'),
('1990-07-28', 'unmarried', 'Central City', 'FlashLight Street 456/20'),
('1000-10-12', 'married', 'Valhalla', 'Gods Avenue 4548/265'),
('1880-05-11', 'unmarried', 'Themeskira', 'ClarkKent Street 547/789'),
('1970-12-23', 'married', 'New York', 'State Street 1005/12');

select * from Personnel; 
select * from Salary;
select * from Another_Info;
