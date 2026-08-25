# AI Workforce Exposure & Risk Analysis Pipeline

📄 **[Click here to view the full Executive Summary Report with Dashboard Visuals (PDF)](./Final%20Report.pdf)**

---

## Executive Summary
Artificial Intelligence is fundamentally reshaping the labor market, yet most exposure models rely on single, biased datasets. This project investigates the true automation vulnerability across an 81.5 million US workforce by engineering an end-to-end data pipeline (SQL to Power BI). 
By blending pre-LLM and post-LLM evaluation datasets to eliminate model divergence, this analysis proposes a definitive framework for identifying which industries, cognitive skills, and education levels face the highest risk of disruption.

## The Problem Space: The White-Collar Pivot
Historically, automation waves (like the Industrial Revolution or robotics) displaced manual, uneducated labor. The core problem evaluated in this project is whether LLM-based AI follows this trend or reverses it. The data reveals a complete reversal: high-wage, highly educated knowledge workers are now the primary targets for automation, while physical trades remain insulated.

## User Research & Hypothesis Testing (Data Exploration)
To isolate true workforce risk, I wrote multi-table SQL queries to test common assumptions against 81.5M employment records. The data decisively killed several intuitive assumptions.

**Hypotheses Validated:**
* **H1: Lower Education = Higher Risk (Rejected)**
  * *Data:* Jobs requiring a Bachelor's degree face the absolute highest AI exposure index (0.47). Jobs requiring no formal education have an index of just 0.12.
* **H2: High Salary is a Safe Haven (Rejected)**
  * *Data:* Developed a Risk-Reward matrix proving high wages do not equal low risk. Roles like Computer & Information Systems Managers ($171,200/yr) sit firmly in the High Wage/High Risk quadrant.
* **H3: Math & Code are Future-Proof (Rejected)**
  * *Data:* High-exposure roles heavily index on Quantitative (2.98) and Verbal (3.97) skills. 
* **H4: Physical Space is the Moat (Confirmed)**
  * *Data:* Spatial reasoning is the only cognitive trait that scores higher in low-exposure roles (2.30) than in high-exposure roles (1.94).

## Methodology: Resolving Model Disagreement
* **The Fix:** Engineered a consolidated metric bridging two competing datasets: AIOE (pre-LLM) and GPT-4/Human evaluations.
* **Mechanism:** SQL cross-joins identified massive divergence in creative and physical roles (e.g., Fitness Trainers showed a >2.3 divergence score). Averaging these metrics neutralized AI evaluation bias against physical labor.

## Workforce Sizing & Impact Analysis
* **Total Analyzed Workforce:** 81,559,900 jobs
* **Most Vulnerable Cohort (Bachelor's Degrees):** 24,882,800 jobs
* **Highly Exposed Industries:** Math (0.58 avg exposure) & Media/Communications (0.56 avg exposure).
* **Insulated Industries:** Construction (0.06 avg exposure).

## KPI Tracking Framework (Dashboard Metrics)
To ensure clear executive reporting, the Power BI dashboard architecture utilized the following hierarchy:
* **North Star Metric:** Weighted AI Exposure Index (Calculated via DAX `AVERAGEX`)
* **Primary (L1) Metrics:**
  * % High Exposure Workforce
  * Average Annual Wage ($)
  * Total Employment Volume (M)
* **Risk Metrics:**
  * Model Divergence Score (Tracking where AI models fail to agree).

## Tools & Technologies Used
* **Data Engineering:** MySQL (DDL/DML schema design, complex `JOIN`s, aggregations, primary key optimization).
* **Data Visualization & BI:** Power BI (Star Schema modeling, advanced DAX calculations, 4-quadrant scatter matrix design).
* **Exploratory Data Analysis:** Advanced Excel / CSV exports for unit economics and dimension ranking.

---

## Repository Structure
* 📄 `Final Report.pdf` - The final executive summary and visual dashboard presentation.
* 📁 `/Data` - Contains raw dimension/fact tables and aggregated CSV datasets.
* 📁 `/SQL_Scripts` - Includes database creation, primary key fixes, and exploratory analysis queries.
* 📁 `/Dashboard` - Contains the Power BI (`.pbix`) interactive dashboard file.
