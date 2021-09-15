-- rename columns in more understandable waye
SELECT [DateKey]
      ,[FullDateAlternateKey] as Date
      --,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek] as Day
     -- ,[SpanishDayNameOfWeek]
    --  ,[FrenchDayNameOfWeek]
     -- ,[DayNumberOfMonth]
     -- ,[DayNumberOfYear]
      ,[WeekNumberOfYear] as Week
      ,[EnglishMonthName] AS Month
     -- ,[SpanishMonthName]
     -- ,[FrenchMonthName]
      ,[MonthNumberOfYear] as MonthNo
      ,[CalendarQuarter] as Quater
      ,[CalendarYear] as Year
     -- ,[CalendarSemester]
     -- ,[FiscalQuarter]
     -- ,[FiscalYear]
      --,[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]