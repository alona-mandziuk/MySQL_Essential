use HRDepartment;

insert into Personal_Info 
(name, surname, birthDate, ITN, passport_number, phone_number, adress)
values
('Daniella', 'Stihl', '1984-05-10', '3856416843', '00069875', '+3251414164', '21354 Apple way 452, Oklahoma');

insert into Personal_Info 
(name, surname, birthDate, ITN, passport_number, phone_number, adress)
values
('Viktor', 'Shevchenko', '1990-01-31', '3556400841', '00111875', '+1251614164', '56354 Sunny street 25, NY');

insert into Contract_number 
(contract_number, contract_date, first_date)
values
('26232/25', '2018-06-28', '2018-07-01');

insert into Contract_number 
(contract_number, contract_date, first_date)
values
('32132/00', '2022-11-20', '2022-11-21');

insert into Position 
(department, position, position_date)
values
('Manufacturing', 'seamstress', '2020-01-10');

insert into Position 
(department, position, position_date)
values
('Human Resourses', 'head of the department', '2022-11-21');

insert into Salary_info 
(salary, premium_percent)
values
(2000, 30);

insert into Salary_info 
(salary, premium_percent)
values
(18000, 27);

insert into Vocation
(accrued_since_start, taken_since_start, taken_this_year, availiable, planned_vocation)
values
(55, 35, 0, 20, '2023-07-10');

insert into Vocation
(accrued_since_start, taken_since_start, taken_this_year, availiable, planned_vocation)
values
(5, 0, 0, 5, '2023-08-01');

insert into Marital_Status 
(marital_status, kids_before_18, kids_name, kids_birthdate)
values
('merried', 1, 'Ben Stihl', '2017-03-23');

insert into Marital_Status 
(marital_status)
values
('merried');

insert into Previouse_expirience 
(education1)
values
('Courses of sueing in Michigan');

insert into Previouse_expirience 
(education1, expirience1, expirience2)
values
('Institute of Business', 'Daneco and co., 2018-2019', 'Nestylu LTD, 2019-2022');

select * from Personal_Info;
select * from Contract_number;
select * from Position;
select * from Salary_info;
select * from Vocation;
select * from Marital_Status;
select * from Previouse_expirience;

select * from Personal_Info
where rollNumber = 2;

select * from Contract_number
where rollNumber = 2;

select * from Marital_Status
where Marital_Status = 'merried';




