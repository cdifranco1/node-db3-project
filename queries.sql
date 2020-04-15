-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

Select Product.ProductName, Category.CategoryName 
From Product
JOIN Category ON Category.Id = Product.CategoryId;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT O.ID, S.CompanyName
FROM [Order] as O
JOIN Shipper as S On S.ID = O.ShipVia
WHERE O.OrderDate < date('2012-08-09')

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity
FROM Product 
JOIN OrderDetail ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251
ORDER BY Product.ProductName ASC;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id as 'OrderId', Customer.CompanyName as 'CustomerName', Employee.LastName as 'EmployeeLastName'
FROM [Order]
JOIN Customer ON Customer.Id = [Order].CustomerId
JOIN Employee ON Employee.Id = [Order].EmployeeId

