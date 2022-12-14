/****** Lesson5  ******/
/*SELECT EmailPromotion, LastName + ' ' + FirstName AS Fullname
FROM [AdventureWorks2020].[Person].[Person]
GROUP BY EmailPromotion, FirstName, LastName
ORDER BY EmailPromotion, Fullname*/

/*SELECT EmailPromotion, COUNT(*) AS CountPerson
FROM [AdventureWorks2020].[Person].[Person]
GROUP BY EmailPromotion
ORDER BY EmailPromotion*/

/*SELECT COUNT(*)
FROM [AdventureWorks2020].[Person].[Person]
WHERE Year(ModifiedDate) = 2011 
AND MONTH(ModifiedDate) = 5 
AND DAY(ModifiedDate) = 24*/

/*SELECT COUNT(*) AS 'У нас номер телефона с 555'
FROM [AdventureWorks2020].[Person].[Person]
WHERE BusinessEntityID IN 
(SELECT BusinessEntityID 
FROM [AdventureWorks2020].[Person].[PersonPhone]
WHERE PhoneNumber LIKE '%-555-%')*/

/*
Хорошая идея, надо подумать
SELECT DISTINCT P.FirstName, TeskiTable.Teski
FROM [AdventureWorks2020].[Person].[Person] AS P, 
(SELECT  FirstName, COUNT(*) AS Teski
FROM [AdventureWorks2020].[Person].[Person]
GROUP BY FirstName
HAVING COUNT(*) > 1) AS TeskiTable
WHERE TeskiTable.FirstName = P.FirstName AND P.EmailPromotion = 2
*/

SELECT SUM(SEL.Teski), AVG(SEL.Teski)
FROM (SELECT EmailPromotion, FirstName, COUNT(*) AS Teski
FROM [AdventureWorks2020].[Person].[Person]
GROUP BY EmailPromotion, FirstName
HAVING COUNT(*) > 1) AS SEL
WHERE SEL.EmailPromotion = 0


