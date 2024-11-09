--Termination rate
SELECT department, 
       total_count,
       terminated_count,
       terminated_count::decimal / total_count AS termination_rate
FROM (
    SELECT department,
           COUNT(*) AS total_count,
           SUM(CASE WHEN termdate <> '0000-00-00' 
                    AND CAST(termdate AS DATE) <= CURRENT_DATE THEN 1 ELSE 0 END) 
	AS terminated_count
    FROM hospital
    WHERE age >= 18
    GROUP BY department
) AS subquery
ORDER BY termination_rate DESC;

--Distribution of employee across location by city and state
select location_state, count(*) as count
from hospital
group by location_state

--How has the company's employee count changed over 
--time based on hire and termdate?

select year,
	hire,terminations,
	hires-termination as net-change
	(hires-terminations)/hires*100

