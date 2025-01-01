# COVID_data_explore

## Dateset Introduction
Dataset Introduction
For this project, I utilized the Our World in Data [COVID-19 Dataset](https://docs.owid.io/projects/etl/api/covid/
), a compact compilation of the most relevant COVID-19 indicators collected over the past few years. This dataset provides a comprehensive overview of global COVID-19 trends, including confirmed cases, deaths, vaccination rates, and testing statistics, making it ideal for exploratory data analysis and visualization.

In this project:

- SQL was used to explore and analyze the dataset, extracting meaningful insights and identifying key trends.
- Tableau was employed to visualize the analysis results, creating interactive and informative dashboards for better data interpretation.
By combining the analytical power of SQL with the intuitive visualization capabilities of Tableau, this project demonstrates my ability to handle complex data workflows and present insights effectively.

## Data Preprocessing

Before loading the dataset into MySQL Workbench, I performed some preprocessing in R (convert_table.rmd) using a script named convert_table.rmd to ensure the data was clean and compatible with SQL operations. This step was essential to address common data inconsistencies and avoid errors during the import process.

### Key Preprocessing Steps:
- Handling Missing Values: Replaced NA values in the dataset with NULL to align with SQL's handling of missing data.
- Data Type Conversion: Converted columns with the integer64 type to double to avoid compatibility issues during SQL ingestion.

## SQL Queries for Tableau: Creating Visualization-Ready Data

### How It Works:
1. The SQL queries, consolidated into a single file (COVID_queries.sql), were executed in MySQL Workbench using the cleaned dataset prepared during the preprocessing step.
2. These queries were designed to generate datasets that can be exported as CSV or Excel files, ready for visualization in Tableau.

## COVID-19 Cases Dashboard![COVID_Analysis](https://github.com/user-attachments/assets/d1e2b80c-4707-470f-8af8-c07ddc3b3313)
