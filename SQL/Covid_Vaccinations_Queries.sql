select 
*
from [Covid_DB]..['Covid_Vaccinations_2020-2023$']


-- Total Population vs Vaccinations

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from [Covid_DB]..['Covid_Deaths_2020-2023$'] dea
join [Covid_DB]..['Covid_Vaccinations_2020-2023$'] vac
	on dea.location = vac.location	
	and dea.date = vac.date
where dea.continent is not null
order by 2,3
