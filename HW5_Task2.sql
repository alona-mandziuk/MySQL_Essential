/*Використовуючи вкладені запити та ShopDB отримати імена покупців та працівників, у яких TotalPrice товару більше 1000.*/

use ShopDB;

create temporary table TmpTable
select (select FName from Employees where EmployeeID = 
			(select EmployeeID from Orders where Orders.OrderID = OrderDetails.OrderID)) as EmployeeFName,
	(select LName from Employees where EmployeeID = 
			(select EmployeeID from Orders where Orders.OrderID = OrderDetails.OrderID)) as EmployeeLName,
	(select FName from Customers where CustomerNo = 
			(select CustomerNo from Orders where Orders.OrderID = OrderDetails.OrderID)) as CustomersFName,
	(select LName from Customers where CustomerNo = 
			(select CustomerNo from Orders where Orders.OrderID = OrderDetails.OrderID)) as CustomersLName,
		TotalPrice FROM OrderDetails;

select EmployeeFName, EmployeeLName, CustomersFName, CustomersLName, SUM(TotalPrice) as TotalSold 
from TmpTable
group by EmployeeFName, EmployeeLName, CustomersFName, CustomersLName
having SUM(TotalPrice) > 1000;
