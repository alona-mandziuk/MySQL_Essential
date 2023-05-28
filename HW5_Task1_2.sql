/*Створіть виборку за допомогою вкладених запитів для таких завдань:
1) отримайте контактні дані працівників (номера телефонів, адреса проживання);
2) отримайте інформацію про дату народження всіх неодружених працівників та їх номера;
3) отримайте інформацію про всіх менеджерів компанії: дату народження та номер телефону.*/

use MyJoinsDB;
select phone, 
(select adress from Another_Info where Personnel.pers_ID = Another_Info.id) as adress,
(select city from Another_Info where Personnel.pers_ID = Another_Info.id) as city
 from Personnel;
 
 select birthdate, 
 (select phone from Personnel where Personnel.pers_ID = Another_Info.id) as phone
 from Another_Info where marital_status = 0;
 
 select birthdate, 
 (select phone from Personnel where Personnel.pers_ID = Another_Info.id) as phone
 from Another_Info 
 where 
 (select id from Salary where Another_Info.id = Salary.id and position = 'Manager'); 