# Security Events Pipeline

A data pipeline for cybersecurity event analysis, built with **dbt + DuckDB**.

## What does this project do?

Transforms raw security logs into actionable metrics to detect threats and suspicious behavior.

## Project Structure
seeds/
raw_security_events.csv     # Raw security event logs
models/
staging/
stg_security_events.sql   # Data cleaning and type casting
marts/
suspicious_ips.sql        # IPs with 3+ failed attempts
attacks_by_hour.sql       # Attack distribution by hour
## Models

- **stg_security_events**: cleans and casts raw events, extracts hour from timestamp
- **suspicious_ips**: identifies IPs with repeated failed login or attack attempts
- **attacks_by_hour**: shows which hours of the day have the highest suspicious activity

## Tech Stack

- dbt 1.10 + DuckDB
- Python 3.9
- Data quality tests: uniqueness, not null, accepted values

## How to run

```bash
dbt seed    # Load raw data
dbt run     # Execute models
dbt test    # Validate data quality
```

## Results

- Detected IPs with brute force patterns (3+ failed attempts)
- Identified peak attack hours (2-5 AM)
- 4 data quality tests passing with 0 errors