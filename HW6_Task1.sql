/*Task 1. 
Зайдіть в БД “MyJoinsDB”, з минулого завдання. Проаналізуйте, які типи індексів задані на створених таблицях.
---
Посилання на базу даних:
https://github.com/alona-mandziuk/MySQL_Essential/blob/main/HW5_Task1_1.sql
Таблиця Personnel - елемент pers_ID - ключ.
Таблиця Salary - елемент id - ключ.
Таблиця Another_Info - елемент id - ключ.
Усі ці елементи відповідають кластерному індексу, оскільки система створює з primary key індекс автоматично.
---

Task 2. 
Встановіть свої індекси на таблицях, обгрунтуйте їх необхідність.*/

use  MyJoinsDB;
select * from Personnel; 
select * from Salary;
select * from Another_Info;

create index Personnel on Personnel (pers_ID); -- створення власного кластеризрваного індексу
create index Salary on Salary (position); -- створення некластеризованого індексу, 
											-- необхідний через те, що часто відбувається пошук працівників по посаді.
                                            -- Різні типи індексів створюються відповідно бізнес-логіки та необхідності виконання того чи іншого завдання.
/*Ідексування має відбуватись раціонально, оскільки створення індексів копіює таблицю, та, відповідно, використовується більше пам'яті пристрою.
Але, коли бізнес вимагає швидкого опрацювання пошуку серед великого об'єму інформації, у нагоді стають індекси.*/                                            


/*Task 3.
Створіть представлення таких завдань:
1) необхідно дізнатись контактні дані працівників: номера телефонів, місце проживання.
2) необхідно дізнатись інформацію про дату народження всіх неодружених працівників та їх номера телефонів.
3) необхідно дізнатись інформацію про дату народження всіх працівників з посадою менеджер та номера телефонів.
*/

create view phone_and_adress as
select phone, 
(select adress from Another_Info where Personnel.pers_ID = Another_Info.id) as adress,
(select city from Another_Info where Personnel.pers_ID = Another_Info.id) as city
 from Personnel;
 
 select * from phone_and_adress;
 
 create view birthday_phone_of_unmarried as
 select birthdate, 
 (select phone from Personnel where Personnel.pers_ID = Another_Info.id) as phone
 from Another_Info where marital_status = 0;
 
 select * from birthday_phone_of_unmarried;
 
 create view manager_birthday_and_phone as
 select birthdate, 
 (select phone from Personnel where Personnel.pers_ID = Another_Info.id) as phone
 from Another_Info 
 where 
 (select id from Salary where Another_Info.id = Salary.id and position = 'manager'); 
 
 select * from manager_birthday_and_phone;