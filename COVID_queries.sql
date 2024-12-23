SELECT country,date,total_cases,new_cases,total_deaths,population
FROM COVID_data.compact_covert

-- death likehood by detected cases
SELECT country,date,total_cases,total_deaths,total_deaths/total_cases*100 as death_rate
FROM COVID_data.compact_covert
WHERE continent not like '' and country = 'United States'

-- Detected rates by country population
SELECT country,date,total_cases,population,total_cases/population*100 as Detect_rate
FROM COVID_data.compact_covert
WHERE continent not like '' and country = 'United States'

-- country with highes infection rate by population
SELECT country,population,max(total_cases) as max_cases,max(total_cases/population)*100 as Max_detect_rate
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY country,population
ORDER BY Max_detect_rate desc

-- country with highes death rate compared to population
SELECT country,max(total_deaths) as max_deaths
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY country
ORDER BY max_deaths desc

-- highes death rate compared to population by continent
SELECT continent,sum(max_deaths) as total_deaths
FROM
(SELECT continent,country,max(total_deaths) as max_deaths
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY continent,country) as tmp
GROUP BY continent

-- continents with the highest death count per population
SELECT continent,sum(max_deaths)/sum(population)*100 as deaths_rate_continent
FROM
(SELECT continent,country,population,max(total_deaths) as max_deaths
FROM COVID_data.compact_covert
WHERE continent not like ''
GROUP BY continent,country,population) as tmp
GROUP BY continent
ORDER BY deaths_rate_continent DESC





