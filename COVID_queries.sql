-- COVID Cases Explore

-- Death likehood by detected cases
SELECT country,STR_TO_DATE(date, '%m/%d/%y') AS formatted_date,total_cases,total_deaths,total_deaths/total_cases*100 as death_rate
FROM COVID_data.compact_covert
WHERE continent not like '' and country = 'United States'
ORDER BY formatted_date

-- Global death rate
SELECT sum(new_cases) as total_cases,sum(new_deaths) as total_death,sum(new_deaths)/sum(new_cases)*100 as death_rate
FROM COVID_data.compact_covert
WHERE continent not like '' 

-- Detected rates by country population
SELECT country,STR_TO_DATE(date, '%m/%d/%y') AS formatted_date,total_cases,population,total_cases/population*100 as Detect_rate
FROM COVID_data.compact_covert
WHERE continent not like '' -- and country = 'United States'
order by country,formatted_date

-- Country with highes infection rate by population
SELECT country,population,max(total_cases) as max_cases,max(total_cases/population)*100 as Max_detect_rate
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY country,population
ORDER BY Max_detect_rate DESC

-- Country with highes death rate compared to population
SELECT country,max(total_deaths) as max_deaths
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY country
ORDER BY max_deaths desc

-- Total death count by continent
SELECT continent,sum(max_deaths) as total_deaths
FROM
(SELECT continent,country,max(total_deaths) as max_deaths
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY continent,country) as tmp
GROUP BY continent
order by total_deaths desc

-- Continents with the highest death count per population
SELECT continent,sum(max_deaths)/sum(population)*100 as deaths_rate_continent
FROM
(SELECT continent,country,population,max(total_deaths) as max_deaths
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY continent,country,population) as tmp
GROUP BY continent
ORDER BY deaths_rate_continent DESC

-- From global perspective
SELECT STR_TO_DATE(date, '%m/%d/%y') AS formatted_date,sum(new_cases) as total_new_cases,sum(new_deaths) as total_new_deaths, sum(new_deaths)/sum(new_cases)*100 as deathpercentage
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY formatted_date
ORDER BY formatted_date

-- Look at total vaccination numbern and percentage
WITH acc_vac_tb as (SELECT continent,country,STR_TO_DATE(date, '%m/%d/%y') AS formatted_date,new_vaccinations,sum(new_vaccinations) over(partition by country order by country,STR_TO_DATE(date, '%m/%d/%y')) as acc_vac, population 
FROM COVID_data.compact_covert
WHERE continent not like ''
order by continent,country,formatted_date)

SELECT *,acc_vac/population*100 as vac_percentage
FROM acc_vac_tb
WHERE country='Canada'







