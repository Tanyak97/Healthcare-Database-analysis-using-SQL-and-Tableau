select * from hospitals_new;
- - First Query - Get count of all  hospitals 
SELECT COUNT( `Facility.Name`) 
FROM hospitals_new

- - Second Query - Get no. of total hospitals in Texas
SELECT COUNT(`Facility.Name`) AS Total_Hospitals_in_Texas
FROM hospitals_new
WHERE `Facility.State` = 'TX';

- - Third Query - Which State has the best rating

SELECT `Facility.State`, MAX(`Rating.Overall`) AS MAX_Rating
From hospitals_new
Group By `Facility.State` 
ORDER BY MAX_Rating DESC
LIMIT 1;

- - Fourth Query- Facility Name where Cost of heart attack surgery is between 5000-15000

SELECT `Facility.Name`, MIN( `Procedure.Heart Attack.Cost`) AS Min_HeartAttack_Cost
FROM hospitals_new 
GROUP BY `Facility.Name`
HAVING Min_HeartAttack_Cost BETWEEN 5000 AND 15000
ORDER BY Min_HeartAttack_Cost
Limit 5;

- - Fifth Query- Facility Name and State where Cost of knee hip surgery is the highest
SELECT `Facility.Name`, `Facility.State`,`Facility.City`,MAX(`Procedure.Hip Knee.Cost`) AS Highest_cost_knee_by_state_and_city
FROM hospitals_new
GROUP BY `Facility.Name`, `Facility.State`,`Facility.City`
ORDER BY Highest_cost_knee_by_state_and_city DESC
Limit 1;

- - Sixth Query - How many private hospitals are there in total by city
SELECT `Facility.Name`, `Facility.City`, COUNT(*) AS Total_privatehospitals_by_city
FROM hospitals_new
WHERE `Facility.Type` = 'private'
GROUP BY `Facility.Name`, `Facility.City`
ORDER BY Total_privatehospitals_by_city DESC
LIMIT 5;



