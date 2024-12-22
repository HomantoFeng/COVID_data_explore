SELECT country,date,total_cases,new_cases,total_deaths,population
FROM COVID_data.compact_covert

-- death likehood by detected cases
SELECT country,date,total_cases,total_deaths,total_deaths/total_cases*100 as death_rate
FROM COVID_data.compact_covert
WHERE country = 'United States'

-- Detected rates by country population
SELECT country,date,total_cases,total_cases/population*100 as detect_rate
FROM COVID_data.compact_covert
WHERE country = 'United States'