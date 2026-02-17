### Airbnb End-to-End Data Engineering Pipeline

#### Project Summary

This project demonstrates a complete end-to-end data engineering workflow built on modern cloud data stack technologies. It processes Airbnb datasets through a scalable transformation pipeline and produces analytics-ready datasets using industry best practices.

The solution uses Snowflake as the data warehouse, dbt for transformations, and AWS storage for raw data handling. Data moves through a Medallion Architecture (Bronze → Silver → Gold) to ensure quality, performance, and maintainability.

The project showcases incremental processing, historical data tracking, modular transformations, and analytics modeling.



### Architecture Overview

##### Data Flow Pipeline

CSV Source Files
        ↓
AWS S3 Storage
        ↓
Snowflake Staging Tables
        ↓
Bronze Layer (Raw Data)
        ↓
Silver Layer (Cleaned Data)
        ↓
Gold Layer (Analytics Ready)


#### Technology Stack

Layer 




