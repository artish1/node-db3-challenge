-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName
    , c.CategoryName 
    FROM product as p
JOIN Category as c on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, s.CompanyName, o.OrderDate from [order] as o
JOIN Shipper as s on o.ShipVia = s.Id
WHERE o.OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT od.OrderId, p.ProductName, od.Quantity FROM OrderDetail as od
JOIN Product as p on od.ProductId = p.Id
WHERE od.OrderId = "10251"
order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT ord.Id as OrderID, c.CompanyName, e.LastName as EmployeeLastName FROM [Order] as ord
JOIN Employee as e on ord.EmployeeId = e.id
JOIN Customer as c on ord.CustomerId = c.Id;
