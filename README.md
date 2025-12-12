# COVID-19 Global Data Analysis Project

## 📊 Project Overview

This comprehensive data analysis project explores global COVID-19 trends from 2020 to 2023, providing insights into infection rates, mortality statistics, and vaccination progress across countries and continents. The project demonstrates end-to-end data analysis capabilities, from data preparation to interactive visualization.

## 🎯 Project Objectives

- **Analyze Global COVID-19 Impact**: Examine infection rates, death percentages, and mortality trends across different countries and continents
- **Evaluate Vaccination Progress**: Track vaccination rollout and calculate vaccination-to-population ratios
- **Identify Key Patterns**: Discover countries with highest infection rates, death counts, and vaccination coverage
- **Create Actionable Insights**: Transform raw data into meaningful visualizations for decision-making

## 🛠️ Tools & Technologies

- **Microsoft Excel**: Data source management and initial data preparation
- **Microsoft SQL Server**: Data cleaning, transformation, and complex querying
- **Tableau**: Interactive data visualization and dashboard creation

## 📁 Project Structure

```
Covid_Deaths_Analysis_Excel_SQL_Tableau_Project/
│
├── Data_Set/
│   ├── Covid_Deaths_2020-2023.xlsx
│   ├── Covid_Deaths_2020-2023.csv
│   ├── Covid_Vaccinations_2020-2023.xlsx
│   ├── Covid_Vaccinations_2020-2023.csv
│   └── Tableau_Table*.xlsx (processed data exports)
│
├── SQL/
│   ├── Covid_Deaths_Queries.sql
│   └── Covid_Vaccinations_Queries.sql
│
├── Tableau/
│   └── Covid_DB_Visualizations.twb
│
└── README.md
```

## 📈 Key Analyses Performed

### Death Analysis (`Covid_Deaths_Queries.sql`)
- **Death Percentage by Location**: Calculated likelihood of dying if contracting COVID-19 in specific countries
- **Infection Rate Analysis**: Percentage of population infected by country
- **Highest Infection Countries**: Ranked countries by infection rate relative to population
- **Death Count Rankings**: Countries and continents with highest total death counts
- **Global Statistics**: Worldwide totals and death percentages over time

### Vaccination Analysis (`Covid_Vaccinations_Queries.sql`)
- **Rolling Vaccination Totals**: Cumulative vaccination counts using window functions
- **Vaccination-to-Population Ratio**: Percentage of population vaccinated over time
- **Advanced SQL Techniques**: Implementation of CTEs (Common Table Expressions), temporary tables, and views
- **Data Integration**: Joining death and vaccination datasets for comprehensive analysis

## 🔍 SQL Techniques Demonstrated

- **Window Functions**: `SUM() OVER()` for rolling calculations
- **Common Table Expressions (CTEs)**: Complex query organization
- **Temporary Tables**: Intermediate data storage and processing
- **Views**: Reusable query structures for visualization
- **Data Type Handling**: `TRY_CONVERT()`, `NULLIF()` for robust data processing
- **Aggregations**: `GROUP BY`, `MAX()`, `SUM()` for statistical analysis
- **Joins**: `INNER JOIN` for combining related datasets

## 📊 Visualizations

The Tableau workbook (`Covid_DB_Visualizations.twb`) includes interactive dashboards featuring:
- Geographic visualizations of COVID-19 impact
- Time-series analysis of cases and deaths
- Vaccination progress tracking
- Comparative analysis across countries and continents
- Dynamic filtering and drill-down capabilities

## 🚀 Getting Started

### Prerequisites
- Microsoft SQL Server (or compatible database system)
- Tableau Desktop (for viewing visualizations)
- Microsoft Excel (for data source files)

### Setup Instructions

1. **Import Data to SQL Server**
   - Import the Excel/CSV files from `Data_Set/` into your SQL Server database
   - Ensure tables are named: `Covid_Deaths_2020-2023$` and `Covid_Vaccinations_2020-2023$`

2. **Execute SQL Queries**
   - Run queries from `SQL/Covid_Deaths_Queries.sql` to analyze death statistics
   - Run queries from `SQL/Covid_Vaccinations_Queries.sql` to analyze vaccination data
   - Create the view `VaccinationstoPopulationPercentage` for Tableau integration

3. **Open Tableau Workbook**
   - Open `Tableau/Covid_DB_Visualizations.twb` in Tableau Desktop
   - Connect to your SQL Server database or use the exported Excel files
   - Refresh data connections as needed

## 📝 Key Findings

- Identified countries with highest infection rates relative to population
- Calculated global death percentages and trends over time
- Tracked vaccination rollout progress and coverage rates
- Analyzed continental and country-level patterns in COVID-19 impact

## 💡 Skills Demonstrated

- **Data Cleaning**: Handling NULL values, data type conversions, error prevention
- **SQL Querying**: Complex joins, aggregations, window functions, and subqueries
- **Data Analysis**: Statistical calculations, percentage computations, trend analysis
- **Data Visualization**: Creating interactive dashboards and meaningful visualizations
- **Problem Solving**: Addressing data quality issues and optimizing query performance

## 📄 License

This project is for educational and portfolio purposes.

## 👤 Author

Created as part of a comprehensive data analysis portfolio project.

---

**Note**: This project uses publicly available COVID-19 data for analysis and visualization purposes. All analyses are based on the dataset covering the period 2020-2023.
