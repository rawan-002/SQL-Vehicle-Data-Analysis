# Vehicle Data Analysis (SQL)
A comprehensive and analytical SQL project built using SQL Server (T-SQL). This system simulates a professional automotive data environment, focusing on complex relational data, manufacturing statistics, and advanced reporting.

## Key Features
### Vehicle & Manufacturer Management
* **Inventory Insights:** Categorize and track vehicles by Make, Model, and SubModel.
* **Manufacturing Stats:** Analyze production volumes and identify top manufacturers.
* **Filter Engine Specs:** Deep-dive into technical details like Engine CC, Cylinders, and Liter displays.

### Data Logic & Transformation
* **Conditional Labeling:** Dynamic door description and tax calculation using CASE statements.
* **Data Cleaning:** Robust handling of NULL values and unspecified data to ensure report integrity.
* **Age Calculation:** Real-time car age tracking using temporal SQL functions.

### Relational Insights
* **Multi-Table Joins:** Seamless integration between Makes, Models, Fuel Types, and Body styles.
* **Self-Joins:** Demonstration of hierarchical relationships (e.g., Manager-Employee structures).
* **Advanced Filtering:** Using Subqueries and CTE-like logic to identify top-tier engine performances.

## Concepts & SQL Principles
This project demonstrates advanced Database concepts:

* **Relational Mapping:** Expert implementation of Inner, Left, and Full Joins across multiple entities.
* **Aggregation & Grouping:** Leveraging `GROUP BY` and `HAVING` for complex statistical summaries.
* **Conditional Logic:** Using `CASE` and `COALESCE` to transform raw data into human-readable information.
* **Set Operations:** Utilizing `EXISTS`, `IN`, and `BETWEEN` for high-performance data filtering.
* **Data Integrity:** Implementation of Primary and Foreign Keys to maintain relational consistency.

## Project Structure
* **Database_Setup/**: Contains the core `.sql` schema to build the database from scratch.
* **01_Basic_Queries.sql**: Focuses on selection, filtering, and text-based searching.
* **02_Aggregations.sql**: Handles grouping, counts, and statistical manufacturing reports.
* **03_Logic_Transformation.sql**: Demonstrates CASE statements, Null handling, and Age calculations.
* **04_Advanced_Relational.sql**: Contains the "Heavy Lifting" queries (Subqueries, Joins, and Logic).

## How to Run
1. Clone the repository:
   ```bash
   git clone [https://github.com/rawan-002/Vehicle-Data-Analysis.git](https://github.com/rawan-002/Vehicle-Data-Analysis.git)
