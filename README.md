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

## 📊 Visualizations

The Tableau workbook (`Covid_DB_Visualizations.twb`) includes interactive dashboards featuring:
- Geographic visualizations of COVID-19 impact
- Time-series analysis of cases and deaths
- Vaccination progress tracking
- Comparative analysis across countries and continents
- Dynamic filtering and drill-down capabilities