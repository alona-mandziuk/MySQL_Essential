/*Використовуючи БД carsshop створіть функцію для знаходження мінімального віку клієнта,
потім зробіть виборку всіз машин, які він придбав.*/

create database carsshop;
use carsshop;

create table clients					
(id int auto_increment not null primary key,  
firstname varchar(25) not null,
lastname varchar(25) not null,
age varchar(25) not null,
phone varchar(25)
);

create table cars
(car_id int auto_increment not null primary key,
client_id int not null,
foreign key (client_id) references clients (id),
mark varchar(20) not null,
model varchar(20),
speed int,
price int
);

insert into clients					
(firstname, lastname, age, phone)
values
('SpongeBoby', 'SqurePanties', 25, '(055)5555558'),
('Patricia', 'Starlett', 35, '(077)000777777'),
('Squdwardy', 'Tanticles', 40, '(033)12135448');

insert into cars
(client_id, mark, model, speed, price)
values
(1, 'Audi', 'A4', 250, 30000),
(1, 'Volkswagen', 'Caddy', 180, 20000),
(2, 'Mercedes', 'ML', 270, 70000),
(2, 'Fiat', 'F500', 190, 15000),
(3, 'Audi', 'A6', 260, 60000),
(3, 'Audi', 'A3', 200, 35000);

delimiter |
create function get_yangest_client ()
returns int
READS SQL DATA
DETERMINISTIC
begin
return (select min(age) from clients);
end
|


drop function get_yangest_client ();

delimiter |
select get_yangest_client ();
|

select mark, model, clients.id as clientID from cars join clients
on cars.client_id = clients.id
where clients.age = get_yangest_client ();

