----------exos1----------

SELECT ROW_NUMBER() OVER (ORDER BY CompanyName ASC) AS '',
		CompanyName AS 'Société',
		ContactName AS 'Contact',
		ContactTitle AS 'Fonction',
		Phone AS 'Téléphone'
FROM customers
WHERE country LIKE 'france'
ORDER BY  CompanyName;

----------exos2----------

SELECT ROW_NUMBER() OVER() AS '',
		ProductName AS 'produit',
		UnitPrice AS 'prix unitaire'
FROM products
JOIN suppliers ON suppliers.SupplierID=products.SupplierID
WHERE CompanyName = 'Exotic Liquids';

----------exos3-----------

SELECT ROW_NUMBER() OVER() AS '',
		CompanyName AS 'Fournisseur',
		COUNT(country) AS 'nbre de produits'
FROM products
JOIN suppliers ON suppliers.SupplierID=products.SupplierID
WHERE Country= 'France'
GROUP BY products.SupplierID
ORDER BY COUNT(country) DESC;

----------exos4-----------

SELECT ROW_NUMBER() OVER (ORDER BY CompanyName ASC) AS '',
		CompanyName AS 'Client',
		COUNT(customers.CustomerID) AS 'nbre de commandes'
FROM customers
JOIN orders ON orders.CustomerID=customers.CustomerID
WHERE country LIKE 'france'
GROUP BY orders.CustomerID
HAVING COUNT(customers.CustomerID) > 10;

----------exos5------------

SELECT ROW_NUMBER() OVER () AS '',
		CompanyName AS 'Client', 
		SUM(UnitPrice * Quantity) AS 'CA', 
		Country AS 'Pays' 
FROM customers
JOIN orders ON orders.CustomerID=customers.CustomerID
JOIN order_details ON order_details.OrderID =orders.OrderID
GROUP BY orders.CustomerID
HAVING SUM(UnitPrice * Quantity) > 30000
ORDER BY SUM(UnitPrice * Quantity) desc;

----------exos6-----------

SELECT ROW_NUMBER() OVER(ORDER BY ShipCountry) AS '',
		Shipcountry AS 'Pays'
		FROM orders
JOIN order_details ON order_details.OrderID=orders.OrderID
JOIN products ON products.ProductID=order_details.ProductID
JOIN suppliers ON suppliers.SupplierID=products.SupplierID
	WHERE CompanyName = 'Exotic Liquids'
	GROUP BY Shipcountry;

----------exos7-----------

SELECT ROW_NUMBER() OVER() AS '',
SUM(UnitPrice*Quantity) AS 'Montant Ventes 1997'
	FROM order_details
JOIN orders ON order_details.OrderID=orders.OrderID
WHERE YEAR(OrderDate) = 1997;

----------exos8-----------

SELECT ROW_NUMBER() OVER(ORDER BY MONTH(OrderDate)) AS '',
		MONTH(OrderDate) AS 'mois 97',
SUM(UnitPrice*Quantity) AS 'Montant Ventes 1997'
	FROM order_details
JOIN orders ON order_details.OrderID=orders.OrderID
WHERE YEAR(OrderDate) = 1997
GROUP BY MONTH(OrderDate);

----------exos9------------

SELECT ROW_NUMBER() OVER() AS '',
		MAX(OrderDate) AS 'Date de dernière commande'
	FROM orders
JOIN customers ON customers.CustomerID=orders.CustomerID
	WHERE CompanyName = 'Du monde entier';

----------exos10-----------

SELECT ROW_NUMBER() OVER() AS '',
		Round(AVG(DATEDIFF(ShippedDate,OrderDate))) AS 'délai moyen de livraison en jours'
FROM orders 
