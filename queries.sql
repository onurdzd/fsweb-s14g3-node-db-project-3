-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
SELECT ProductName,CategoryName FROM Product as p left JOIN Category as c ON p.id=c.Id
-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
SELECT s.CompanyName,o.id FROM Shipper as s LEFT JOIN Order as o ON s.id=o.ShipVia WHERE o.OrderDate<"2012-08-09"
-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
SELECT OrderId,ProductName,Quantity FROM OrderDetail as o INNER JOIN Product as p ON p.id=o.ProductId WHERE OrderId=10251
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
SELECT c.CompanyName,o.id,LastName FROM Order as o INNER JOIN Employee as e ON e.id=o.EmployeeId INNER JOIN Customer as c ON c.id=o.CustomerId