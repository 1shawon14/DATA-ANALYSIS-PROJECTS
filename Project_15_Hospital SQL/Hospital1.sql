--Gender breakdown of the employee in the company
select gender, count(*) as count from hospital
where age>=18
group by gender

	
ALTER TABLE hospital
ALTER COLUMN termdate TYPE VARCHAR;
UPDATE hospital
SET termdate = NULL
WHERE termdate IS NULL OR termdate = '0000-00-00';
select termdate from hospital

--Ethnicity breakdown of employee in the company
select race, count(*) as count
from hospital
group by race order by count desc

-- Age distribution of employee in the copany.
select min(age) as youngest,
max(age) as oldest
from hospital

select 
	case 
		when age>= 18 and age<=24 then '18-24'
		when age>= 25 and age<=34 then '25-34'
		when age>= 35 and age<=44 then '35-44'
		when age>= 45 and age<=54 then '45-54'
		when age>= 55 and age<=64 then '55-64'
		else '65+'
	End as age_group,gender,count(*) as count from hospital
group by age_group,gender order by count desc

-- Working at headquarter vs remote location
select loc as location, count(*) as count 
from hospital
group by location

-- Average length of terminated
SELECT AVG(
    EXTRACT(YEAR FROM AGE(
        termdate::DATE, 
        hire_date::DATE
    )) +
    EXTRACT(MONTH FROM AGE(
        termdate::DATE, 
        hire_date::DATE
    )) / 12.0
) AS avg_length_employment
FROM hospital;

-- Distribution of job title
select jobtitle, count(*) as count
from hospital
group by jobtitle order by count desc