--Looking at total cases vs total Death

select location,date, total_cases,total_deaths,CAST((total_deaths / total_cases) AS Numeric(5,5)) AS Deathpercentage, (total_cases - total_deaths) as survived
from death
where location = 'United States'
--Looking at total cases vs total Death
select location,date, total_cases,population,CAST((total_cases / population) AS Numeric(5,10)) AS Casepercentage from death
where location = 'United States'
 -- Total cases in united states
select Sum(total_cases) as totalcase from death
where location = 'United States'

-- Toatal in all location
select location, sum(total_cases) as cases, sum(population) as pop from death
where cases is not null
group by location 
order by cases desc;
