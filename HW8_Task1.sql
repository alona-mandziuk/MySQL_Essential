/*Створіть БВ з іменем "MyFunkDB"
В даній БД створіть 3 таблиці:
в 1-й містяться імена та номера телефонів працівників компанії;
в 2-й - відомості про зарплату та посади: головний директор, менеджер, робочий;
в 3-й - інформація про сімейне положення, дату народження та місце проживання.
Виконайте ряд записів вставки в вигляді транзакцій в процедурі. Якщо такий працівник існує, відкотіть БВ назад.
Створіть тригер, який буде видаляти записи з 2-ї та 3-ї таблиці перед видаленням записів із 1-ї таблиці, щоб не порушити цілісність даних.*/


drop database if exists MyFunkDB;
create database MyFunkDB;
use MyFunkDB;

drop table if exists Another_Info;
drop table if exists Salary;
drop table if exists Personnel; 

create table if not exists Personnel (
pers_ID int auto_increment not null primary key,
name varchar (30) not null,
surname varchar (30) not null,
phone varchar (13)
);

create table if not exists Salary (
id int not null primary key,
foreign key (id) references Personnel (pers_ID),
position varchar (40),
salary int
);

create table if not exists Another_Info (
id int not null primary key,
foreign key (id) references Personnel (pers_ID),
birthdate date,
marital_status varchar (20),
city varchar (30),
adress varchar (50)
);


/*Виконайте ряд записів вставки в вигляді транзакцій в процедурі. Якщо такий працівник існує, відкотіть БВ назад.*/


delimiter |
drop procedure if exists insert_the_person;|
create procedure insert_the_person (in Nname varchar (30), in Ssurname varchar (30), in Pphone varchar (13), in Pposition varchar (40), in Ssalary int,
 in Bbirthdate date, in Mmarital_status varchar (20), in Ccity varchar (30), in Aadress varchar (50))
 begin
 declare id_I int;
start transaction;
 insert Personnel (name, surname, phone) values (Nname, Ssurname, Pphone);
 set id_I = @@IDENTITY;
  insert Salary (id, position, salary) values (id_I, Pposition, Ssalary);
 insert Another_Info (id, birthdate, marital_status, city, adress) values (id_I, Bbirthdate, Mmarital_status, Ccity, Aadress);
  if exists (select * from Personnel where name = Nname and surname = Ssurname and phone = Pphone and pers_ID != id_I) 
  then
  rollback;
  end if;
 commit;
 end;
 |

call insert_the_person ('Homer', 'Simpsonson', '+111115555599', 'worker', 20000, '1975-08-01', 'married', 'Springfiel-city', 'Evergreen Terrase 5656');
call insert_the_person ('Bart', 'Simpsonson', '+113455555599', 'worker', 24000, '1975-08-01', 'married', 'Springfiel-city', 'Evergreen Terrase 5656');
call insert_the_person ('Patric', 'Star', '+8888888', 'Manager', 80000, '2000-09-30', 'unmarried', 'BikiniButtumn', 'Rock');


/*Створіть тригер, який буде видаляти записи з 2-ї та 3-ї таблиці перед видаленням записів із 1-ї таблиці, щоб не порушити цілісність даних.*/


delimiter |
drop trigger if exists delete_profile; |
create trigger delete_profile
before delete on Personnel
for each row 
begin
delete from Salary where id = OLD.pers_ID;
delete from Another_Info where id = OLD.pers_ID;
end;
|

delete from Personnel where name = 'Homer';

select * from Personnel; 
select * from Salary;
select * from Another_Info;