use AdventureWorks2012

--q1

select SalesOrderID,ShipDate
from Sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'

--q2

select ProductID,Product.Name
from Production.Product
where StandardCost<110.00

--q3

select ProductID,Product.Name
from Production.Product
where Weight = NULL

--q4

select ProductID,Product.Name,Product.Color
from Production.Product
where Color in('Silvre','Black','Red')

--q5

select ProductID,Product.Name
from Production.Product
where Product.Name like 'B%'

--q6

UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select Description
from Production.ProductDescription
where Description like '%_%'

--q7
--xxxxxxx
select sum(TotalDue) as TotalDue
from Sales.SalesOrderHeader
where OrderDate between '7/1/2001' and '7/31/2014'
group by OrderDate

--q8

select DISTINCT Employee.HireDate
from HumanResources.Employee

--q9

select DISTINCT avg(Product.ListPrice) as ListPrices
from Production.Product
group by Product.ListPrice

--q10

select  Product.Name  as [ProductName] ,Product.ListPrice as [ListPrice]
from Production.Product
where Product.ListPrice in (100,120)
order by Product.ListPrice 

--q11

--a

select rowguid,Name,SalesPersonID,Demographics into store_Archive 
from Sales.Store

--b

select rowguid,Name,SalesPersonID,Demographics 
from Sales.Store

--q12

select GETDATE() as 'YYYY-MM-DD'
union
select getdate() as 'MM/DD/YY'


--part3

--Global variable names begin with a @@ prefix. 
--You do not need to declare them, since the server constantly maintains them. 
--They are system-defined functions and you cannot declare them.

select @@VERSION  --desplay version of MSSM 

select @@SERVERNAME --desplay serverName 

