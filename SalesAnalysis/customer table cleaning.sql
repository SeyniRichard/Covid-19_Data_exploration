--Cleaning the customer table and adding city for each customer
SELECT c.[CustomerKey]
    --  ,[GeographyKey]
   --   ,[CustomerAlternateKey]
      ,c.[Title]
      ,c.[FirstName] as [First Name]
      --,[MiddleName]
      ,c.[LastName] as [Last Name]
	  --Combine both names
	  ,c.[FirstName]+ ' '+[LastName] as [Full Name]
     -- ,[NameStyle]
     -- ,[BirthDate]
     -- ,[MaritalStatus]
     -- ,[Suffix]
      , CASE c.[Gender] when 'M' then 'Male' when 'F' then 'Female' END AS GENDER
      --,[EmailAddress]
    --  ,[YearlyIncome]
      --,[TotalChildren]
      --,[NumberChildrenAtHome]
      --,[EnglishEducation]
     -- ,[SpanishEducation]
     -- ,[FrenchEducation]
     -- ,[EnglishOccupation]
     -- ,[SpanishOccupation]
     -- ,[FrenchOccupation]
     -- ,[HouseOwnerFlag]
     -- ,[NumberCarsOwned]
     -- ,[AddressLine1]
      --,[AddressLine2]
     -- ,[Phone]
      ,c.[DateFirstPurchase]
     -- ,[CommuteDistance]
	 ,g.[City] as [Customer City]
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer] c
  left join [AdventureWorksDW2019].dbo.DimGeography g
  on c.GeographyKey = g.GeographyKey
  order by c.CustomerKey asc