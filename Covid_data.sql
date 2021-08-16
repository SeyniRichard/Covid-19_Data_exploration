
Select *
from [Portofolio projects].dbo.CovidDeaths
order by 3,4


Select *
from [Portofolio projects].dbo.CovidVaccinations
order by 3,4

Select location, date, new_cases, total_cases, total_deaths, population
from [Portofolio projects].dbo.CovidDeaths
order by 1,2

--Total cases vs total deaths
Select location, date, new_cases, total_cases, total_deaths, (total_deaths/total_cases)*100 AS death_rate
from [Portofolio projects].dbo.CovidDeaths
where location = 'germany'
order by 1,2

-- Total Cases vs Population: To see what percentage of total population that tested positive.

Select location, date, total_cases, population, round((total_cases/population)*100,2) AS infection_rate
from [Portofolio projects].dbo.CovidDeaths
where location = 'Rwanda'
order by 1,2

-- Countries with higher infection rate

Select location,  max(total_cases), population, max(round((total_cases/population)*100,2)) AS infection_rate
from [Portofolio projects].dbo.CovidDeaths
where population >2000000
group by population, location
order by 4 desc

--countries with higher death numbers

Select location, max(cast(total_deaths as int))as total_death_count
from [Portofolio projects].dbo.CovidDeaths
where continent is not null
group by location
order by 2 desc


--classification of continents by death numbers

Select location, max(cast(total_deaths as int))as total_death_count
from [Portofolio projects].dbo.CovidDeaths
where continent is null and location <> 'World'
group by location
order by 2 desc

--death rate by country
Select location, sum(new_cases)as total_cases, sum(cast(new_deaths as int)) as total_death, round(sum(cast(new_deaths as int))/sum(new_cases),3) as death_rate
from [Portofolio projects].dbo.CovidDeaths
where continent is not null and population>2000000
group by location
order by 4 desc

-- Global death rate
Select location, sum(new_cases)as total_cases, sum(cast(new_deaths as int)) as total_death, round(sum(cast(new_deaths as int))/sum(new_cases),3) as death_rate
from [Portofolio projects].dbo.CovidDeaths
where continent is null and location ='World'
group by location
order by 4 desc

--OR

Select sum(new_cases)as total_cases, sum(cast(new_deaths as int)) as total_death, round(sum(cast(new_deaths as int))/sum(new_cases),3) as death_rate
from [Portofolio projects].dbo.CovidDeaths
where continent is not null


--Cumulative vaccination by country
Select D.continent, D.location, D.date, V.new_vaccinations, SUM(convert(int,V.new_vaccinations)) OVER (PARTITION BY D.location order by D.location, D.date) as cumulative_vaccination
from [Portofolio projects].dbo.CovidDeaths as D
join [Portofolio projects].dbo.CovidVaccinations as V
on D.location = V.location
and D.date = V.date
where D.continent is not null







