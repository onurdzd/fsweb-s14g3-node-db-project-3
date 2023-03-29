1-SELECT count(o.ShipperID),o.ShipperID FROM Orders as o JOIN Shippers as s ON s.ShipperID = o.ShipperID group by o.ShipperID

2-SELECT Count(OrderID),e.EmployeeID FROM Orders as o INNER JOIN Employees as e ON e.EmployeeId=o.EmployeeId GROUP BY e.EmployeeId ORDER BY Count(OrderID) DESC LIMIT 5

3-SELECT SUM(p.price*od.quantity),e.EmployeeId,p.price,od.quantity FROM Orders as o INNER JOIN Employees as e ON e.EmployeeId=o.EmployeeId INNER JOIN OrderDetails as od ON o.OrderID=od.OrderID INNER JOIN Products as p ON p.ProductID=od.ProductID group by e.EmployeeId ORDER BY SUM(p.price*od.quantity) DESC LIMIT 5

4-SELECT SUM(p.price*od.quantity),c.CategoryID,p.price,od.quantity FROM Orders as o INNER JOIN OrderDetails as od ON o.OrderID=od.OrderID INNER JOIN Products as p ON p.ProductID=od.ProductID INNER JOIN Categories as c ON c.CategoryID=p.CategoryID group by c.CategoryID ORDER BY SUM(p.price*od.quantity) asc LIMIT 1

5-SELECT count(orderid),c.CustomerID,c.country FROM Orders as o INNER JOIN Customers as c ON c.CustomerID=o.CustomerID group by c.CustomerID order by count(orderid) desc limit 1 