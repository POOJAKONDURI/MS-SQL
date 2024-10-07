select * from covid_19_clean_complete;

-- To find out the death percentage globally--
SELECT ROUND(100*(SUM(CAST(Deaths as float))/SUM(CAST(Confirmed as float))),2) as death_percentage FROM covid_19_clean_complete;
-- To find out the death percentage locally --
SELECT ROUND(100*(SUM(CAST(Deaths as float))/SUM(CAST(Confirmed as float))),2) as death_percentage FROM covid_19_clean_complete WHERE [Country Region] = 'India';


SELECT * FROM worldometer_data;

--To find out the infected population globally
SELECT 100*SUM(CAST(TotalCases as float))/SUM(CAST(Population as float)) FROM worldometer_data;
--To find out the infected population percentage locally
SELECT 100*SUM(CAST(TotalCases as float))/SUM(CAST(Population as float)) FROM worldometer_data WHERE [Country Region] = 'India';

--To find out the countries with the highest infection rates

SELECT TOP 10 [Country Region], (CAST(TotalCases AS float) / CAST(Population as float)) * 100 AS infection_rate
FROM worldometer_data
WHERE Population > 0
ORDER BY infection_rate DESC;

--. To find out the countries and continents with the highest death counts
SELECT TOP 5 [Country Region]
FROM worldometer_data
ORDER BY TotalDeaths DESC;



--Average number of deaths by day (Continents and Countries)
SELECT * FROM day_wise;

SELECT AVG(CAST(Deaths AS float)) AS Average_Deaths
FROM day_wise;

--Average of cases divided by the number of population of each country (TOP 10)
SELECT TOP 10 AVG(CAST(TotalCases as float))/Population AS avg_cases
FROM worldometer_data
WHERE Population >0
GROUP BY Population; 


--Considering the highest value of total cases, which countries have the highest rate of infection in relation to population?
SELECT TOP 10 [Country Region], (CAST(TotalCases AS float) / CAST(Population as float)) * 100 AS infection_rate 
FROM worldometer_data 
WHERE Population > 0
ORDER BY infection_rate DESC;


Select * FROM covid_vaccine_statewise;

--Using JOINS to combine the covid_deaths and covid_vaccine tables :

--To find out the population vs the number of people vaccinated
SELECT wd.Population, cvs.[Total Doses Administered], cvs.State
FROM worldometer_data as wd 
cross join covid_vaccine_statewise as cvs
WHERE wd.[Country Region] = 'India';


--To find out the percentage of different vaccine taken by people in a country

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'covid_vaccine_statewise';

SELECT  
    100 * SUM(CAST(Population AS FLOAT)) / 
    (
        SELECT (SUM(CAST([Covaxin (Doses Administered)] AS FLOAT)))
        FROM covid_vaccine_statewise
    ) AS Covaxin_people_percentage 
FROM 
    worldometer_data 
WHERE 
    [Country Region] = 'India';


--To find out the percentage of different vaccine taken by people in a country
SELECT 100 * SUM(CAST(Population AS float))/(SELECT SUM(cast([Covaxin (Doses Administered)] as float)) FROM covid_vaccine_statewise)  AS Covaxin_people_percentage FROM worldometer_data WHERE [Country Region] = 'India';

SELECT 100 * SUM(CAST(Population AS float))/(SELECT SUM(cast([CoviShield (Doses Administered)] as float))FROM covid_vaccine_statewise)  AS CoviSheild_people_percentage FROM worldometer_data WHERE [Country Region] = 'India';

SELECT 100 * SUM(CAST(Population AS float))/(SELECT SUM(cast([Sputnik V (Doses Administered)] as float)) FROM covid_vaccine_statewise)  AS putnik_V_Doses_people_percentage FROM worldometer_data WHERE [Country Region] = 'India';


--To find out percentage of people who took both the doses
SELECT 100 * SUM(CAST(Population AS float))/(SELECT SUM(cast([Total Doses Administered] as float)) FROM  covid_vaccine_statewise) AS percentange_people_taken_both_doses FROM worldometer_data WHERE [Country Region] = 'India';








