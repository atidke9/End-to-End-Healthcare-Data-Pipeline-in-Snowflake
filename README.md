# End-to-End-Healthcare-Data-Pipeline-in-Snowflake
Built with 1M+ Synthetic Records using Free Snowflake Credits

📌 **Project Overview**

This project demonstrates how to build a complete end-to-end data pipeline in Snowflake using more than 1 million synthetic healthcare records.
Although I used healthcare data because of my background, the entire design works for any industry or dataset.

The pipeline covers:

Bronze → Silver → Gold medallion architecture

- Raw data ingestion

- Data cleaning and standardization

- Incremental loading using Snowflake Streams

- Automated tasks using Snowflake Tasks

- MERGE-based upserts

- Analytics-ready Gold summary tables

- Orchestration with task dependencies

- Cost-efficient warehouse usage

- Domain-independent best practices

This repository contains the SQL scripts and workflow needed to recreate the entire pipeline.

🏗 **Architecture Diagram**

<img width="638" height="92" alt="image" src="https://github.com/user-attachments/assets/e653f252-edbe-435b-bb0b-1fbe538f93ca" />

📁 **Repository Structure**

<img width="317" height="626" alt="image" src="https://github.com/user-attachments/assets/f5237b4e-f3e5-4e19-b8eb-71b25b4b1287" />


📊 **Dataset**

This project uses Synthea, a fully synthetic healthcare dataset (no PHI).

Included tables:

- patients.csv
- encounters.csv
- observations.csv
- plus additional clinical-level files

Total size: 1,000,000+ rows

Dataset link:
👉 https://synthea.mitre.org/downloads

🔥 Key Features

✔ Bronze Layer (Raw Data)
Exact copy of source files
No transformations
Ideal for debugging and replaying data

✔ Silver Layer (Cleaned Data)
Renamed fields
Correct data types
Standardized timestamps
Domain-ready schema structures

✔ Gold Layer (Analytics)
Aggregate tables
Visit-level summaries
Age/gender breakdowns
Encounter class intelligence
Business-ready metrics

✔ Incremental Pipelines
Snowflake Streams track inserts/updates
MERGE used for efficient upserts
No full reload required

✔ Automated Workflow
Snowflake Tasks refresh Silver + Gold
t_build_gold depends on t_upsert_encounters
Runs hands-free on a schedule
XS warehouse for minimum credit usage

🧠 **Skills Demonstrated**

This project highlights:

Data engineering (ELT pipeline design)
Data modeling (Medallion architecture)
Cloud warehousing (Snowflake)
Incremental loading & CDC
Orchestration & automation
SQL transformation
Domain modeling (healthcare)
Performance-aware design
Cost-efficient infrastructure usage

These skills directly align with roles including:

Data Analyst
Analytics Engineer
Data Engineer
BI Developer
Cloud Data Specialist

🧪 **How to Reproduce This Project**
1. Clone the repo
git clone <your-repo-url>

2. Upload Synthea CSVs to a Snowflake Stage
3. Run scripts in this order:
01_setup → 02_bronze → 03_silver → 04_streams → 05_tasks → 06_gold

4. Resume tasks
ALTER TASK t_upsert_encounters RESUME;
ALTER TASK t_build_gold RESUME;

🚀 Next Steps

This pipeline is only the beginning.
Here are future improvements:

Add data quality checks
Add load audit tables
Add monitoring dashboard
Add masking policies for sensitive fields
Build a Streamlit app on top of the Gold layer
Connect Power BI / Tableau / Looker

_**The Streamlit dashboard is the next story in this series.**_

📝 **Related Articles**

How I Earned My First Snowflake Badge for Free
Building an End-to-End Healthcare Data Pipeline in Snowflake (main story)
How to Talk About This Pipeline in Data Interviews (bonus story)

❤️ Contributions

Feel free to fork, modify, or submit PRs.
This project is meant to help learners and aspiring data professionals.
