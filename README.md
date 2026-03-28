**Case-Study-Capstone-Google-Data-Analytics-Certificate** 

# Cyclistic Bike-Share Analysis: Converting Casual Riders to Members

## Project Overview
This case study explores the differences between casual riders and annual members of Cyclistic, a bike-share company in Chicago. The goal is to provide data-driven recommendations to convert casual riders into long-term members to maximize company profitability.

## Data Stack
* **Data Processing:** Google Colab (Python)
* **Data Cleaning & Analysis:** SQL (BigQuery)
* **Data Visualization:** Tableau Public

## The 6 Phases of Analysis

### 1. Ask
**Business Task:** Identify how annual members and casual riders use Cyclistic bikes differently to design a targeted marketing strategy.
* **Key Stakeholder:** Moreno (Director of Marketing).
* **Hypothesis:** Converting casuals to members is the most effective way to drive growth.

### 2. Prepare
* **Data Source:** 12 months of historical trip data (2025) from [DivvyBikes](https://divvybikes.com/system-data).
* **Integrity:** Data is anonymized to ensure user privacy.
* **Storage:** Initial formatting was done in Python/Colab to handle large volumes before importing into BigQuery.

### 3. Process & Clean
* **Tools:** SQL (BigQuery).
* **Cleaning steps:** * Merged 12 monthly datasets into one master table.
    * Removed outliers (trips < 1 minute or > 24 hours).
    * Handled null values and formatted timestamps.
    * Created new columns: `ride_length` and `day_of_week`.

### 4. Analyze
**Key Findings:**
* **Frequency:** Members have a significantly higher number of total trips, indicating daily necessity (commuting).
* **Duration:** Casuals have a higher average ride duration, suggesting leisure use.
* **Preferences:** Members prefer classic bikes; casuals show no net preference. Docked bikes were not utilized.

### 5. Share
The visual analysis was created in **Tableau Public** to show the board the disparity in usage patterns and bike preferences between the two groups.

### 6. Act
1. **Targeted Promotions:** Launch a campaign highlighting the "Fun and Health" of commuting by bike, specifically targeting casuals during peak leisure times.
2. **Membership Perks:** Offer a trial period for "seasonal" memberships to bridge the gap for leisure riders.
3. **Operational Focus:** Increase the availability of classic bikes at the top 3 stations frequented by casuals.

---

## Project Links
* **Interactive Dashboard:** [(https://public.tableau.com/views/CaseStudy_Google/BeaviourDifference?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)]
* **SQL Queries:** [[Uploading CYCLISTIC CASE STUDY Data Analysis.sql…]()
]
