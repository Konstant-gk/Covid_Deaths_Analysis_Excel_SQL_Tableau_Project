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

select SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(new_deaths)/SUM(NULLIF(new_cases,0)) * 100 as DeathPercentage
from Covid_DB..['Covid_Deaths_2020-2023$']
where continent is not null
order by 1,2