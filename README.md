# Airbnb Data Warehouse Project

## Overview
This project demonstrates a complete ELT workflow using Snowflake, dbt, Dagster, and Preset (Apache Superset) on a Inside Airbnb open source data. For this project the data is for Airbnb listings, reviews, and host information for Berlin from 2015 to 2021. 

The goal is to transform raw listings, hosts, and reviews into analytics-ready dimensional models to analyze host performance, pricing, and review trends. The pipeline covers ingestion, transformation, testing, orchestration, and visualization.

**Repository:** https://github.com/adrianc7/airbnb-dbt-project  
**Presentation:** [airbnb_dbt_project_ppt.pdf](./Others/airbnb_dbt_project_ppt.pdf)

---

## Tech Stack

| Category | Tools / Technologies |
|:--|:--|
| Data Warehouse | Snowflake |
| Transformation | dbt (Jinja) |
| Orchestration | Dagster |
| Visualization | Preset (Apache Superset) |
| Source Data | Inside Airbnb Open Data |
| Languages | SQL, Python |
| Version Control | Git, GitHub |

---

## Architecture

Raw Airbnb Data (CSV / Inside Airbnb)  
↓  
Snowflake Raw Schema  
↓  
dbt Staging Models (`src_`)  
↓  
dbt Core Models (`dim_`, `fct_`)  
↓  
Analytics Marts (`mart_`)  
↓  
Preset (Dashboards)  
↓  
Dagster (Scheduling, Lineage)

---

## Repository Contents

| Path | Description |
|:--|:--|
| `airbnb/` | Main dbt project (models, macros, snapshots, tests, seeds). |
| `my_dbt_dagster_project/` | Dagster project (assets, schedules, definitions). |
| `Others/` | Snowflake SQL setup scripts and presentation PDFs. |
| `requirements.txt` | Python dependencies for dbt and Dagster. |
| `README.md` | This file. |

### Key Files
- `airbnb/dbt_project.yml` — dbt project configuration  
- `airbnb/profiles.yml` — Snowflake profile for local runs  
- `airbnb/packages.yml` — dbt packages  
- `airbnb/macros/select_positive_values.sql` — custom test macro  
- `airbnb/snapshots/raw_hosts_snapshot.yml` — snapshot config (SCD Type 2–style tracking)  
- `Others/snowflake_script_copies/*.sql` — Snowflake role/user/warehouse setup  

---

## Folder Structure
```
.
├── Others
│   ├── snowflake_script_copies
│   │   ├── airbnb_raw_setup_and_imports.sql
│   │   ├── airbnb_user_role_creation.sql
│   │   └── operations.sql
│   ├── Airbnb_2021_Dashboard.pdf
│   └── airbnb_dbt_project_ppt.pdf
│
├── airbnb
│   ├── analyses
│   │   ├── .gitkeep
│   │   └── full_moon_no_sleep.sql
│   ├── assets
│   │   └── input_schema.png
│   ├── macros
│   │   ├── .gitkeep
│   │   ├── no_empty_strings.sql
│   │   └── select_positive_values.sql
│   ├── models
│   │   ├── src
│   │   ├── dim
│   │   ├── fct
│   │   ├── mart
│   │   ├── dashboards.yml
│   │   ├── schema.yml
│   │   └── sources.yml
│   ├── seeds
│   │   ├── .gitkeep
│   │   └── seed_full_moon_dates.csv
│   ├── snapshots
│   │   ├── .gitkeep
│   │   ├── raw_hosts_snapshot.yml
│   │   └── raw_listings_snapshot.yml
│   ├── tests
│   │   ├── .gitkeep
│   │   └── dim_listings_minimum_nights.sql
│   ├── .gitignore
│   ├── .user.yml
│   ├── README.md
│   ├── dbt_project.yml
│   ├── package-lock.yml
│   ├── packages.yml
│   └── profiles.yml
│
├── my_dbt_dagster_project
│   ├── my_dbt_dagster_project
│   │   ├── __init__.py
│   │   ├── assets.py
│   │   ├── definitions.py
│   │   ├── project.py
│   │   └── schedules.py
│   ├── pyproject.toml
│   └── setup.py
│
├── .gitattributes
├── .gitignore
├── README.md
├── project_structure.txt
└── requirements.txt
```
---

## Project Phases and Highlights

### 1. Snowflake Setup
- Provisioned databases, roles, and warehouses using SQL scripts in `Others/snowflake_script_copies/`.
- Loaded raw Inside Airbnb CSVs into Snowflake raw schema.

**Outcome:** Secure, reproducible cloud data foundation.

### 2. dbt Transformations
- Layered models:
  - `src_` → staging (cleaned, casted data)
  - `dim_` & `fct_` → conformed dimensions and facts
  - `mart_` → analytics-ready aggregates
- Implemented schema and data tests (`unique`, `not_null`, relationships, and custom `positive_values`).
- Used snapshots for historical tracking (SCD-type logic).

**Outcome:** Modular SQL transformations with automated testing.

### 3. Orchestration with Dagster
- dbt executed via Dagster assets with defined schedules and jobs.
- Interactive data lineage visualization in Dagster UI.

**Outcome:** Scheduling, observability, and lineage tracking in one unified workflow.

### 4. Visualization and Insights
- Preset dashboards connected to the Snowflake analytics schema.
- Example insights:
  - Price and occupancy trends by neighborhood  
  - Superhost performance metrics  
  - Review volume and sentiment over time  
  - Correlations around full-moon dates (demo seed)  

**Outcome:** Actionable business insights from a governed data warehouse.

---

## Results and Learning Outcomes

| Area | Outcome |
|:--|:--|
| Modeling | Dimensional design across staging, core, and marts |
| Quality | dbt schema tests + custom macros |
| Orchestration | Automated runs and lineage with Dagster |
| Visualization | Interactive dashboards via Preset |
| Reproducibility | Version-controlled SQL, macros, snapshots, seeds |

---

## Dashboard and Slides

- **Dashboard:** [Airbnb_2021_Dashboard.pdf](./Others/Airbnb_2021_Dashboard.pdf)  
- **Presentation:** [airbnb_dbt_project_ppt.pdf](./Others/airbnb_dbt_project_ppt.pdf)

---

## References
- Inside Airbnb: [https://insideairbnb.com/get-the-data/](https://insideairbnb.com/get-the-data/)  
- dbt: [https://docs.getdbt.com/](https://docs.getdbt.com/)  
- Dagster: [https://docs.dagster.io/](https://docs.dagster.io/)  
- Preset (Superset): [https://preset.io/](https://preset.io/)
