/*Task 1. Спроектуйте БД для оптового складу, в якому є постачальники товарів,
 персонал, постійні замовники. Поля таблиць придумати самостійно.*/
 
 create database Wholesale_Warehouse;
 use Wholesale_Warehouse;
 
 /*The suplier table*/
 
 create table Supliers (
 suplierID int not null unique,
 companyName varchar(30) not null,
 typeOfGoods varchar (50),
 contactPerson varchar (30),
 phoneNumber varchar (20) not null,
 adress varchar (60),
 primary key (suplierID) 
 );
 
 /*The table, which contains the information about the personnel of the wharehouse.*/
 
 create table Personnel (
 persID int auto_increment not null unique,
 persName varchar (30) not null,
 position varchar (50),
 phoneNumber varchar (20) not null,
 department varchar (30) not null,
 primary key (persID)
 );
 
 /*The table, which contains the info about customers.*/
 
 create table Customers (
 customerID int auto_increment not null,
 customerName varchar (40) not null,
 phoneNumber varchar (20) not null,
 company varchar (50),
 deliveryAdress varchar (60), 
 primary key (customerID) 
 );
 
 insert into Supliers 
 (suplierID, companyName, typeOfGoods,  contactPerson, phoneNumber, adress)
 values
 (10003, 'FoodExpress', 'different types of products', 'Dana Mevison', '+1002445454', '20155 Evergreen Terrase 458, USA'),
 (10025, 'SwettLife', 'different types of sweets', 'Willy Wonka', '+1466511351', '85412 Forever Yong street 25/45b, USA'),
 (24586, 'ForcePower', 'goods for sports', 'Dwane Johnson', '+152135434', '10256 Happyhappy street 48, GB'); 
 
 select * from Supliers;
 
 select contactPerson, phoneNumber from Supliers
 where companyName = 'FoodExpress';
 
 drop table Supliers;
 
 insert into Personnel
 (persName, position, phoneNumber, department)
 values
 ('Lary Harison', 'accountant', '+6554844131', 'Economics'), 
 ('Mandy Moon', 'secretary', '+6554844131', 'Economics'),
 ('Fred Gooddman', 'security', '+531511514', 'Security department'),
 ('Wendy Lipson', 'head of the security department', '+2313515415', 'Security department');
 drop table Personnel;
 select * from Personnel
 where department = 'Security department';
 
 insert into Customers 
 (customerName, phoneNumber)
 values
 ('Anna Plax', '+516515615'),
 ('Gen Fillo', '+95223623026');
 
 select * from Customers;
 