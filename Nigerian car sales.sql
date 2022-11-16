-- Master raw table

Select *
From CarSales..car_prices$

-- To check for duplicates

Select car_id, COUNT(car_id) as duplicates
From CarSales..car_prices$
Group by car_id
Order by duplicates asc

-- To eliminate duplicates

With duplicates
as
(
Select car_id, ROW_NUMBER () OVER (Partition by car_id Order by car_id) as duplicates
From CarSales..car_prices$
)
Delete from duplicates 
Where duplicates > 1

-- Duplicates removed
-- Total number of car sold

Select COUNT(car_id) as TotalSold
From CarSales..car_prices$

-- To know gear type based on prices

Select [gear type], COUNT([gear type]) as TotalCar
From CarSales..car_prices$
Where [gear type] is not null
Group by [gear type]

-- To know model and make of the car

Select Make, Model, COUNT(Model) as TotalCar
From CarSales..car_prices$
Group by Make, Model

Select Make, COUNT(Make) as TotalCar
From CarSales..car_prices$
Group by Make
Order by TotalCar desc

-- To know the highest and trend of manufacture of car sold

Select [Year of manufacture], COUNT([Year of manufacture]) as TotalCarSold
From CarSales..car_prices$
Group by [Year of manufacture]
Order by [Year of manufacture] desc

-- To know the relationship between mileage, engine size and car price

Select TOP (100) car_id, Mileage, [Engine Size], price
From CarSales..car_prices$
Order by price desc

-- To know total car sold fuel type 

Select [fuel type], COUNT([fuel type]) as TotalCar
From CarSales..car_prices$
Where [fuel type] is not null
Group by [fuel type]





