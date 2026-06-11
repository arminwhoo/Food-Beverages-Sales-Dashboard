SELECT
		ord.OrderID,
		cus.ContactName,
		pro.ProductName,
		cat.CategoryName,
		SUM (det.Quantity) as 'Total Units',
		SUM (det.Quantity * det.UnitPrice) as 'Revenue',
		CONCAT (emp.FirstName,' ',emp.LastName) as 'Sales Rep'

FROM
		dbo.Orders ord
JOIN	dbo.Customers cus
ON		ord.CustomerID = cus.CustomerID
JOIN	dbo.[Order Details] det
ON		ord.OrderID = det.OrderID
JOIN	dbo.Products pro
ON		det.ProductID = pro.ProductID
JOIN	dbo.Categories cat
ON		pro.CategoryID = cat.CategoryID
JOIN	dbo.Employees emp
ON		ord.EmployeeID = emp.EmployeeID

GROUP BY
		ord.OrderID,
		cus.ContactName,
		pro.ProductName,
		cat.CategoryName,
		CONCAT (emp.FirstName,' ',emp.LastName)