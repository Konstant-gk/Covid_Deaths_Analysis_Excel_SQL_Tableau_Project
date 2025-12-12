select 
*
from [Covid_DB]..['Covid_Vaccinations_2020-2023$']


-- Total Population vs Vaccinations

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from [Covid_DB]..['Covid_Deaths_2020-2023$'] dea
join [Covid_DB]..['Covid_Vaccinations_2020-2023$'] vac
	on dea.location = vac.location	
	and dea.date = vac.date
where dea.continent is not null
order by 2,3


-- CTE

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingVaccinations)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingVaccinations
from [Covid_DB]..['Covid_Deaths_2020-2023$'] dea
join [Covid_DB]..['Covid_Vaccinations_2020-2023$'] vac
	on dea.location = vac.location	
	and dea.date = vac.date
where dea.continent is not null
)
select
*, (RollingVaccinations/population)*100 as VaccinationstoPopulationPercentage
from PopvsVac


-- Temporary Table for Vaccinations to Population Ratio

Drop Table if exists #VaccinationstoPopulationPercentage
Create Table #VaccinationstoPopulationPercentage
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingVaccinations numeric
)

Insert Into #VaccinationstoPopulationPercentage
Select dea.continent, dea.location, dea.date, dea.population, TRY_CONVERT(BIGINT, vac.new_vaccinations) as New_Vaccinations, SUM(TRY_CONVERT(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingVaccinations
From [Covid_DB]..['Covid_Deaths_2020-2023$'] dea
join [Covid_DB]..['Covid_Vaccinations_2020-2023$'] vac
	on dea.location = vac.location	
	and dea.date = vac.date

Select
*, (RollingVaccinations/population)*100 as VaccinationstoPopulationPercentage
from #VaccinationstoPopulationPercentage



--View to store data for visualizations

Create View VaccinationstoPopulationPercentage as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingVaccinations
from [Covid_DB]..['Covid_Deaths_2020-2023$'] dea
join [Covid_DB]..['Covid_Vaccinations_2020-2023$'] vac
	on dea.location = vac.location	
	and dea.date = vac.date
where dea.continent is not null



Select *
From VaccinationstoPopulationPercentage