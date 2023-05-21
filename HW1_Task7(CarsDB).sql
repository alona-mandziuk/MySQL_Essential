/*Використовуючи MySQL Workbench створити пусту базу даних автомобілей. 
Заповнити таблицю даними (id(Autoincrement), марка, модель, об'єм двигуна, ціна, макс. швидкість).*/

create database Cars;
use Cars;

create table CarsInfo (
id int auto_increment not null,
brand varchar (30) not null,
model varchar (20),
engine_capacity int,
price int,
max_speed int,
primary key (id)
);

insert into CarsInfo
(brand, model, engine_capacity, price, max_speed)
values
('Audi', 'A4', 2000, 30000, 300);

select * from CarsInfo;

