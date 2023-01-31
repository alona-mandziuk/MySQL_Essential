/*Створіть виборку за допомоги JOIN’s для таких завдань:
1) отримайте контактні дані працівників (номера телефонів, адреса проживання);
2) отримайте інформацію про дату народження всіх неодружених працівників та їх номера;
3) отримайте інформацію про всіх менеджерів компанії: дату народження та номер телефону.*/
use MyJoinsDB; 

select Personnel.pers_ID, Personnel.name, Personnel.surname, Personnel.phone, Another_Info.city, Another_Info.adress
from Personnel
join Another_Info
on Personnel.pers_ID = Another_Info.id;

select Personnel.pers_ID, Personnel.name, Personnel.surname, Personnel.phone,  
Another_Info.birthdate
from Personnel
join Another_Info
on Personnel.pers_ID = Another_Info.id
where Another_info.marital_status = 'unmarried';

select Personnel.pers_ID, Personnel.name, Personnel.surname, Personnel.phone, Another_Info.birthdate from Personnel
join Another_Info
on Personnel.pers_ID = Another_Info.id
join Salary 
on Personnel.pers_ID = Salary.id
where Salary.position = 'manager';
