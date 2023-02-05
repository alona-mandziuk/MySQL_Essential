/*Використовуючи БД ShopDB та сторінку Customers (видаліть таблицю, якщо є, та створіть заново:
перший раз без первинного ключа, а потім - з ним) і потім додайте індекси та проаналізуйте виборку даних. */

use ShopDB;
drop table Customers;
drop table Orders;
drop table OrderDetails;

create table Customers                
(                                      
	CustomerNo int NOT NULL, 
	CustomerName varchar(25) NOT NULL,
	Address varchar(25) NOT NULL,
	City varchar(15) NOT NULL,
	Phone char(12),
	DateInSystem datetime NOT NULL 
);

insert into Customers 
(CustomerNo, CustomerName, Address, City, Phone, DateInSystem)
values
(001, 'Martin McFly', 'Funny Alley 2045', 'Springfield', '(035)4687125', NOW()),
(002, 'Patric Star', 'BigRockNearPineapple 1', 'BikiniButtomn', '(333)1111111', NOW());

explain select * from Customers;
explain select CustomerName, Address, City, Phone from Customers;
explain select CustomerName from Customers where city = 'BikiniButtomn';

drop table AnotherCustomers;
create table AnotherCustomers                
(                                      
	CustomerNo int NOT NULL primary key, 
	CustomerName varchar(25) NOT NULL,
	Address varchar(25) NOT NULL,
	City varchar(15) NOT NULL,
	Phone char(12),
	DateInSystem datetime NOT NULL 
);

insert into AnotherCustomers 
(CustomerNo, CustomerName, Address, City, Phone, DateInSystem)
values
(011, 'Martin McFly', 'Funny Alley 2045', 'Springfield', '(035)4687125', NOW()),
(012, 'Patric Star', 'BigRockNearPineapple 1', 'BikiniButtomn', '(333)1111111', NOW());

explain select * from AnotherCustomers;
explain select CustomerName, Address, City, Phone from AnotherCustomers;
explain select CustomerName from AnotherCustomers where city = 'BikiniButtomn';

create index AnotherCustomers on
AnotherCustomers (CustomerNo);

create index Customers on
Customers (city);
