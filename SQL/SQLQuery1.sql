select 
*
from Covid_DB..['Covid_Deaths_2020-2023$']
order by 3,4

--select 
--*
--from Covid_DB..['Covid_Vaccinations_2020-2023$']
--order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from Covid_DB..['Covid_Deaths_2020-2023$']
order by 1,2