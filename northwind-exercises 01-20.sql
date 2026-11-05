-- database: ./Northwind SQLite Database.sqlite
---1. Select all category names with their descriptions from the Categories table.

select CategoryName, Description
from categories;

----2. Select the contact name, customer id, and company name of all Customers in London
select ContactName, CustomerID, CompanyName
from Customers
where city = 'London';

---3. Marketing managers and sales representatives have asked you to select all available columns in the Suppliers tables that have a FAX number.
select *
from Suppliers
where Fax is not null;

---4. Select a list of customers id’s from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.
select customerid
from Orders
where requireddate between '2017-01-01' and '2018-01-01' and freight <100;

---5. Select a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.
select companyname, contactname
from Customers
where country = 'Mexico' or country = 'Sweden' or country = 'Germany';

----6. Count the number of discontinued products in the Products table.
select count(*)
from Products
where discontinued = 1;

----7.Select a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
select CategoryName, Description
from Categories
where CategoryName like 'Co%';

----8. Select all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should be ordered alphabetically by company name.
select companyname, city, country
from Suppliers
where address like '%rue%'
order by companyname ASC;

---9.Select the product id and the total quantities ordered for each product id in the Order Details table.
select productid, sum(quantity) as total_quantity
from `Order Details`
group by productid;

---10.Select the customer name and customer address of all customers with orders that shipped using Speedy Express.
select c.contactname, c.address
from Customers c
join orders o on c.customerid = o.CustomerID
where o.shipvia = 1;

---11.Select a list of Suppliers containing company name, contact name, contact title and region description.
select companyname, contactname, contacttitle, region
from suppliers;

---12.Select all product names from the Products table that are condiments.
select productname
from Products
where categoryid = 2;

---13.Select a list of customer names who have no orders in the Orders table.
select contactname
from customers c
left join orders o on c.customerid = o.CustomerID
where o.CustomerID is null;

---14.Add a shipper named 'Amazon' to the Shippers table using SQL.
insert into shippers (companyname) values ('Amazon');

---15.Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
update shippers
set companyname = 'Amazon Prime Shipping'
where companyname = 'Amazon';

--16.Select a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select s.companyname, round(sum(freight),0) as totalfreight
from Shippers s
join orders o on s.shipperid = o.ShipVia
group by s.shipperid, s.companyname;

--17.Select all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
select concat (lastname,' ',firstname)as DisplayName
from employees;

--18.Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.

insert into customers (customerid, companyname, contactname, contacttitle)
values ('Thank', 'Mike Company', 'Mike', 'Accounting manager');

insert into orders (orderid, customerid, employeeid, orderdate)
values (11080, 'Thank', 1, '2024-06-01');

insert into `Order Details` (orderid, productid, unitprice, quantity)
values (11080, 6, 25.00, 10);

select productid
from products
where productname = 'Grandma''s Boysenberry Spread';

---19.Remove yourself and your order from the database.
delete from `Order Details`
where orderid = 11080 and productid = 6;

delete from Orders
where orderid = 11080;

delete from Customers
where customerid = 'Thank';

---20. Select a list of products from the Products table along with the total units in stock for each product. Give the computed column a name using the alias, 'TotalUnits'. Include only products with TotalUnits greater than 100.

select productid, productname, sum(unitsinstock) as TotalUnits 
from Products
where unitsinstock > 100
group by productid, productname;