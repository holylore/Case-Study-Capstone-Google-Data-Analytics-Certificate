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

## Full SQL Script
The following code represents the complete data analysis pipeline executed in Google BigQuery, covering the cleaning, transformation, and insight extraction phases.

```sql
-- ========================================================
-- GOOGLE DATA ANALYTICS CAPSTONE PROJECT: CYCLISTIC
-- FULL SQL ANALYSIS PIPELINE
-- ========================================================

-- STEP 1: PRELIMINARY DATA EXPLORATION
-- Checking the structure and consistency of the merged dataset
SELECT 
  EXTRACT(MONTH FROM started_at) AS month, 
  COUNT(*) AS total_rides
FROM `sharp-theory-489817-t3.CaseStudy_Google.CaseStudy_Google`
GROUP BY month
ORDER BY month;

-- STEP 2: KPI CALCULATION - AVERAGE RIDE LENGTH
-- Calculating average duration per user type to identify usage patterns
SELECT 
  member_casual, 
  AVG(ride_length) AS avg_ride_duration
FROM `sharp-theory-489817-t3.CaseStudy_Google.CaseStudy_Google`
GROUP BY member_casual;

-- STEP 3: RIDE FREQUENCY BY DAY OF THE WEEK
-- Analyzing which days are most popular for each user group
SELECT 
  member_casual, 
  day_of_week, 
  COUNT(*) AS total_rides
FROM `sharp-theory-489817-t3.CaseStudy_Google.CaseStudy_Google`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, total_rides DESC;

-- STEP 4: BIKE PREFERENCE ANALYSIS
-- Identifying the most used bike types by casuals vs members
SELECT 
  member_casual, 
  rideable_type, 
  COUNT(*) AS count_rides
FROM `sharp-theory-489817-t3.CaseStudy_Google.CaseStudy_Google`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, count_rides DESC;

-- STEP 5: MONTHLY TRENDS
-- Observing seasonal impacts on bike usage
SELECT 
  member_casual, 
  EXTRACT(MONTH FROM started_at) AS month, 
  COUNT(*) AS monthly_rides
FROM `sharp-theory-489817-t3.CaseStudy_Google.CaseStudy_Google`
GROUP BY member_casual, month
ORDER BY month, member_casual;

-- ========================================================
-- END OF SCRIPT
-- ========================================================
