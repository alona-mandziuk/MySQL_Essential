/*Створіть БД з іменем “MyJoinsDB”.*/

create database MyJoinsDB;
use MyJoinsDB;
drop database MyJoinsDB;
/*В даній БД створіть 3 таблиці:
в 1-й містяться імена та номера телефонів працівників компанії;
в 2-й - відомості про зарплату та посади: головний директор, менеджер, робочий;
в 3-й - інформація про сімейне положення, дату народження та місце проживання.*/

create table Personnel (
pers_ID int auto_increment not null primary key,
name varchar (30) not null,
surname varchar (30) not null,
phone varchar (13)
);

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
marital_status boolean,
city varchar (30),
adress varchar (50)
);

insert Personnel 
(name, surname, phone)
values
('Anna', 'Frank', '+1111111235'),
('Ginger', 'Green', '+255151651'),
('Den', 'Wilson', '+94535115'),
('Simon', 'Anderson', '+113515314'),
('Ron', 'Hovardson', '+2236565484');

insert Salary 
(position, salary)
values
('Head manager', 50000),
('Manager', 20000),
('Worker', 10000),
('Worker', 11000),
('Worker', 13000);

insert Another_Info 
(birthdate, marital_status, city, adress)
values
('1982-04-01', 1, 'Chicago', 'Evergreen Terrace 20156'),
('1990-07-28', 0, 'Michigan City', 'Cherry Street 456/20'),
('1979-10-12', 1, 'Chicago', 'Michigan Avenue 4548/265'),
('1987-05-11', 0, 'Chicago', 'Clark Street 547/789'),
('1989-12-23', 1, 'Chicago', 'State Street 1005/12');

select * from Personnel; 
select * from Salary;
select * from Another_Info;