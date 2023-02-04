/*Створіть БД з іменем “MyJoinsDB”.*/
drop database MyJoinsDB;
create database MyJoinsDB;
use MyJoinsDB;

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
marital_status varchar (20),
city varchar (30),
adress varchar (50)
);

insert Personnel 
(name, surname, phone)
values
('Diana', 'Webster', '+156511235'),
('Gven', 'Gibson', '+11210151651'),
('Andrew', 'Appleboy', '+3094535115'),
('Kevin', 'Monk', '+154415314'),
('Ruby', 'Hovardson', '+2236005484');

insert Salary 
(position, salary)
values
('Head manager', 55000),
('Manager', 30000),
('Worker', 15000),
('Worker', 13000),
('Worker', 14500);

insert Another_Info 
(birthdate, marital_status, city, adress)
values
('1982-04-01', 'married', 'Chicago', 'Evergreen Terrace 20156'),
('1990-07-28', 'unmarried', 'Michigan City', 'Cherry Street 456/20'),
('1979-10-12', 'married', 'Chicago', 'Michigan Avenue 4548/265'),
('1987-05-11', 'unmarried', 'Chicago', 'Clark Street 547/789'),
('1989-12-23', 'married', 'Chicago', 'State Street 1005/12');

select * from Personnel; 
select * from Salary;
select * from Another_Info; 
