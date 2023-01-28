/*Task1. Нормалізувати таблицю, що знаходиться в матеріалах до уроку.*/

create database Military_Base;
use Military_Base;

drop table Personnel;
drop table Weapon_Type;
drop table Weapon_Transfer;

select * from Personnel;
select * from Weapon_Type;
select * from Weapon_Transfer;

create table Personnel (
roll_Number int not null unique auto_increment primary key,
name varchar (20) not null,
surname varchar (20) not null,
personnel_rank varchar (20),
platoon_no int,
office_no int
);

create table Weapon_Type (
id_Type int not null unique auto_increment primary key,
weapon_name varchar (30)
);

create table Weapon_Transfer (
transfer_id int not null unique auto_increment primary key,
receiver_id int,
weapon_id int,
dealer_id int,
foreign key (receiver_id) references Personnel (roll_Number),
foreign key (weapon_id) references Weapon_Type (id_Type),
foreign key (dealer_id) references Personnel (roll_Number)
);

/*--------------------------------------------------------------------------*/

insert into Personnel 
(name, surname, personnel_rank, platoon_no, office_no)
values
('Vadym', 'Petrov', 'officer', '222', '205');

insert into Personnel 
(name, surname, personnel_rank, platoon_no, office_no)
values
('Volodymyr', 'Lodarenko', 'officer', '232', '221');

insert into Personnel 
(name, surname, personnel_rank, platoon_no, office_no)
values
('Kostiantyn', 'Loentenko', 'officer', '212', '201');

insert into Personnel 
(name, surname, personnel_rank, platoon_no)
values
('Rostyslav', 'Duhovenko', 'officer', '200');

insert into Personnel 
(name, surname, personnel_rank)
values
('Ostap', 'Burenko', 'major');

insert into Personnel 
(name, surname, personnel_rank)
values
('Mykola', 'Rybak', 'major');

insert into Personnel 
(name, surname, personnel_rank)
values
('Viacheslav', 'Derebanov', 'lieutenant colonel');

/*--------------------------------------------------------------------------*/

insert into Weapon_Type 
(weapon_name)
value
('AK-47');

insert into Weapon_Type 
(weapon_name)
value
('Glok20');

/*--------------------------------------------------------------------------*/

insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(1, 1, 5);

insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(1, 2, 6);

insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(2, 1, 7);

insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(2, 2, 6);

insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(3, 1, 5);

insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(3, 2, 6);

insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(4, 1, 5);



