/*Task 2. Спроектуйте базу даних для системи відділу кадрів*/

create database HRDepartment;
use HRDepartment;
drop database HRDepartment;

create table Personal_Info (
rollNumber int not null auto_increment unique primary key,
name varchar (20) not null,
surname varchar (20) not null,
birthDate date,
ITN varchar (10),
passport_number varchar (10) not null,
phone_number varchar (15),
adress varchar (60)
);

create table Contract_number (
rollNumber int not null auto_increment unique primary key,
foreign key (rollNumber) references Personal_Info (rollNumber),
contract_number varchar (20) not null,
contract_date date,
first_date date
);

create table Position (
rollNumber int not null auto_increment unique primary key,
foreign key (rollNumber) references Personal_Info (rollNumber),
department varchar (30),
position varchar (30),
position_date date
);

create table Salary_info (
rollNumber int not null auto_increment unique primary key,
foreign key (rollNumber) references Personal_Info (rollNumber),
salary double,
premium_percent int
);

create table Vocation (
rollNumber int not null auto_increment unique primary key,
foreign key (rollNumber) references Personal_Info (rollNumber),
taken_since_start int,
taken_this_year int,
availiable int,
planned_vocation varchar (20)
);


create table Marital_Status (
rollNumber int not null auto_increment unique primary key,
marital_status boolean,
kids_before_18 int default 0,
kids_name varchar (20),
kids_birthdate date,
foreign key (rollNumber) references Personal_Info (rollNumber)
);

create table Previouse_expirience (
rollNumber int not null auto_increment unique primary key,
foreign key (rollNumber) references Personal_Info (rollNumber),
education1 varchar (100),
education2 varchar (100),
education3 varchar (100),
expirience1 varchar (100),
expirience2 varchar (100),
expirience3 varchar (100)
);

