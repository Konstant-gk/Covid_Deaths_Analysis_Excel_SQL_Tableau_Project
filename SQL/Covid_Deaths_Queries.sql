select 
*
from Covid_DB..['Covid_Deaths_2020-2023$']
where continent is not null
order by 3,4


select 
*
from Covid_DB..['Covid_Vaccinations_2020-2023$']
where continent is not null
order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from Covid_DB..['Covid_Deaths_2020-2023$']
where continent is not null
order by 1,2

-- Looking at Total cases vs Total deaths
--Shows likelihood of dying if you contract COVID in US

select location, date, total_cases, total_deaths, (total_deaths/NULLIF(total_cases,0))*100 as DeathPercentage
from Covid_DB..['Covid_Deaths_2020-2023$']
where location like '%states%' AND continent is not null
order by 1,2



-- Total cases vs Population
-- Shows what percentage of population got Covid

select location, date, total_cases, population, (total_cases/population)*100 as InfectionPercentage
from Covid_DB..['Covid_Deaths_2020-2023$']
where location like '%states%' AND continent is not null
order by 1,2


-- Looking at countries with highest infection rate compared to population

select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as InfectionPercentage
from Covid_DB..['Covid_Deaths_2020-2023$']
where continent is not null
group by location, population
order by InfectionPercentage desc

-- Showing countries with highest death count per population

select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from Covid_DB..['Covid_Deaths_2020-2023$'] 
where continent is not null
group by location
order by TotalDeathCount desc

-- Show Death count by Continent

select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from Covid_DB..['Covid_Deaths_2020-2023$'] 
where continent is null
group by location
order by TotalDeathCount desc


select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from Covid_DB..['Covid_Deaths_2020-2023$'] 
where continent is not null
group by continent
order by TotalDeathCount desc


-- Global Numbers

select date, SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(new_deaths)/SUM(NULLIF(new_cases,0)) * 100 as DeathPercentage
from Covid_DB..['Covid_Deaths_2020-2023$']
where continent is not null
group by date
order by 1,2


-- Excel Tables for use into Tableau Desktop

--1.

select SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(new_deaths)/SUM(NULLIF(new_cases,0)) * 100 as DeathPercentage
from Covid_DB..['Covid_Deaths_2020-2023$']
where continent is not null
order by 1,2

--2

select location, SUM(cast(new_deaths as int)) as TotalDeathCount
from Covid_DB..['Covid_Deaths_2020-2023$'] 
where continent is null
and location not in 
(
'World', 
'European Union', 
'International', 
'World excl. China',
'World excl. China and South Korea', 
'World excl. China, South Korea, Japan and Singapore', 
'Asia excl. China',
'European Union (27)',
'Lower-middle-income countries',
'Low-income countries',
'Summer Olympics 2020',
'Northern Ireland',
'England and Wales',
'Scotland',
'Winter Olympics 2022',
'Wales',
'England',
'High-income countries',
'Upper-middle-income countries'
)
group by location
order by TotalDeathCount desc


--3

select location, population, MAX(total_cases) as HighInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from Covid_DB..['Covid_Deaths_2020-2023$']
where location not in 
(
'World', 
'European Union', 
'International', 
'World excl. China',
'World excl. China and South Korea', 
'World excl. China, South Korea, Japan and Singapore', 
'Asia excl. China',
'European Union (27)',
'Lower-middle-income countries',
'Low-income countries',
'Summer Olympics 2020',
'Northern Ireland',
'England and Wales',
'Scotland',
'Winter Olympics 2022',
'Wales',
'England',
'High-income countries',
'Upper-middle-income countries'
)
group by location, population
order by PercentPopulationInfected desc


--4

select location, population, date, MAX(total_cases) as HighInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
from Covid_DB..['Covid_Deaths_2020-2023$'] 
where location not in 
(
'World', 
'European Union', 
'International', 
'World excl. China',
'World excl. China and South Korea', 
'World excl. China, South Korea, Japan and Singapore', 
'Asia excl. China',
'European Union (27)',
'Lower-middle-income countries',
'Low-income countries',
'Summer Olympics 2020',
'Northern Ireland',
'England and Wales',
'Scotland',
'Winter Olympics 2022',
'Wales',
'England',
'High-income countries',
'Upper-middle-income countries'
)
group by location, population, date
order by PercentPopulationInfected desc