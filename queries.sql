\sql 

  -- Import to looker studio    --------------------------
SELECT * 
FROM `sql-practice-493603.Digital_Advertising_Dataset.tech_advertising_campaigns_dataset`
  -- Cek apakah jumlah impression > Clicks > Conversion    --------------------------
SELECT
  SUM(impressions) AS Total_Impressions,
  SUM(clicks) AS Total_Clicks,
  SUM(conversions) AS Total_Conversions,
FROM 
  `sql-practice-493603.Digital_Advertising_Dataset.tech_advertising_campaigns_dataset`
-- Cek setiap rows apakah ada yang memiliki value impression < Clicks < Conversion    --------------------------
SELECT
  CASE
    WHEN campaigns.impressions >= campaigns.clicks AND campaigns.clicks >= campaigns.conversions THEN 'TRUE'
    ELSE 'FALSE'
END
  AS condition_met,
  COUNT(*) AS count_of_rows
FROM
  `sql-practice-493603`.`Digital_Advertising_Dataset`.`tech_advertising_campaigns_dataset` AS campaigns
GROUP BY
  condition_met;
-- Cek apakah ada null values    --------------------------
SELECT *
FROM `sql-practice-493603`.Digital_Advertising_Dataset.tech_advertising_campaigns_dataset
WHERE
  campaign_id IS NULL
  AND campaign_objective IS NULL
  AND platform IS NULL
  AND ad_placement IS NULL
  AND device_type IS NULL
  AND operating_system IS NULL
  AND creative_format IS NULL
  AND creative_size IS NULL
  AND ad_copy_length IS NULL
  AND has_call_to_action IS NULL
  AND creative_emotion IS NULL
  AND creative_age_days IS NULL
  AND target_audience_age IS NULL
  AND target_audience_gender IS NULL
  AND audience_interest_category IS NULL
  AND income_bracket IS NULL
  AND purchase_intent_score IS NULL
  AND retargeting_flag IS NULL
  AND start_date IS NULL
  AND quarter IS NULL
  AND day_of_week IS NULL
  AND hour_of_day IS NULL
  AND campaign_day IS NULL
  AND quality_score IS NULL
  AND actual_cpc IS NULL
  AND impressions IS NULL
  AND clicks IS NULL
  AND conversions IS NULL
  AND ad_spend IS NULL
  AND revenue IS NULL
  AND bounce_rate IS NULL
  AND avg_session_duration_seconds IS NULL
  AND pages_per_session IS NULL
  AND industry_vertical IS NULL
  AND budget_tier IS NULL
  AND CTR IS NULL
  AND CPC IS NULL
  AND conversion_rate IS NULL
  AND CPA IS NULL
  AND ROAS IS NULL
  AND profit IS NULL
-- Return number of duplicates pada field campaign_id    --------------------------
SELECT 
  campaign_id,
  COUNT(*) AS Occurances
FROM 
  `sql-practice-493603`.Digital_Advertising_Dataset.tech_advertising_campaigns_dataset
GROUP BY campaign_id
HAVING COUNT(*) > 1
-- Cek setiap rows apakah clicks * actual_cpc = ad_spend dan hitung jumlah rows yang memiliki clicks * actual_cpc = ad_spend serta yang tidak     --------------------------
  SELECT
  SUM(CASE
      WHEN (t0.clicks * t0.actual_cpc) = t0.ad_spend THEN 1
      ELSE 0
  END
    ) AS count_of_true,
  SUM(CASE
      WHEN (t0.clicks * t0.actual_cpc) != t0.ad_spend THEN 1
      ELSE 0
  END
    ) AS count_of_false
FROM
  `sql-practice-493603`.`Digital_Advertising_Dataset`.`tech_advertising_campaigns_dataset` AS t0;
-- Mengecek apakah clicks * actual_CPC = ad_spend    --------------------------
SELECT
  SUM(clicks * actual_CPC) AS Calculated_Ad_Spend,
  SUM(ad_spend) AS ad_spend
FROM
  `sql-practice-493603`.Digital_Advertising_Dataset.tech_advertising_campaigns_dataset
