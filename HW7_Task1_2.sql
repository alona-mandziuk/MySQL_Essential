/*Створіть функції/процедури для таких завдань:
1) отримайте контактні дані працівників (номера телефонів, адреса проживання);
2) отримайте інформацію про дату народження всіх неодружених працівників та їх номера;
3) отримайте інформацію про всіх менеджерів компанії: дату народження та номер телефону.*/

use MyFunkDB;

delimiter |
create procedure get_phone_and_adress ()
begin
select phone, 
(select adress from Another_Info where Personnel.pers_ID = Another_Info.id) as adress,
(select city from Another_Info where Personnel.pers_ID = Another_Info.id) as city
 from Personnel;
 end
 |
 
 delimiter |
 call get_phone_and_adress ();
 | 
 
 delimiter |
 create procedure get_phone_and_birthdate_unmarried ()
 begin
 select birthdate, 
 (select phone from Personnel where Personnel.pers_ID = Another_Info.id) as phone
 from Another_Info where marital_status = 'unmarried';
 end
 |
 delimiter |
 call  get_phone_and_birthdate_unmarried ();
 | 
 

 delimiter |
 create procedure get_birthdate_and_phone_of_managers ()
 begin
 select birthdate, 
 (select phone from Personnel where Personnel.pers_ID = Another_Info.id) as phone
 from Another_Info 
 where 
 (select id from Salary where Another_Info.id = Salary.id and position = 'Manager'); 
 end
 |
 
  delimiter |
  call get_birthdate_and_phone_of_managers ();
  |