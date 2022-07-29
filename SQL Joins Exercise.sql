/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 Select p.name, c.Name
 from products p
 inner join categories c
 on p.CategoryID = c.CategoryID
 where c.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.Name as ProductName, p.Price as ProductPrice, r.Rating as ProductRating
 from products p
 left join reviews r
 on p.ProductID = r.ProductID
 where Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select e.FirstName, e.MiddleInitial, e.LastName, e.EmployeeID, Sum(s.Quantity) as QuantitySold
From employees e
inner join sales s
on e.EmployeeID = s.EmployeeID
Group by e.FirstName, e.LastName
order by Sum(s.Quantity) desc;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as DepartmentName, c.Name as CategoryName
from departments d
left join categories c
on d.DepartmentID = c.DepartmentID
where c.name = 'Appliances' Or c.name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.Name as ProductName, Sum(s.Quantity) as QuantitySold, p.Price*Sum(s.Quantity) as TotalPriceSold
from products p
left join sales s
on p.ProductID = s.ProductID
where p.name like '%Eagles:%Hotel%California%';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name as ProductName, r.Reviewer as ReviewerName, r.Rating as Rating, r.Comment as ReviewerComment
from products p
left join reviews r
on p.ProductID = r.ProductID
where p.name like '%Visio%TV%' And r.rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
Select e.EmployeeID as EmployeeID, e.FirstName as FirstName, e.LastName as LastName, p.Name as ProductName, sum(s.Quantity) as QuantitySold
from products p
left join sales s
on p.ProductID = s.ProductID
right join employees e
on s.EmployeeID = e.EmployeeID
where s.Quantity is not null
group by e.EmployeeID, p.ProductID;







