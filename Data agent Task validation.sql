-- Databricks notebook source
SELECT*
FROM brightlearn.data.tv_user_profile;

SELECT*
FROM brightlearn.data.tv_viewership;

---Which province has the highest number of subscribers?
SELECT
    Province,
    COUNT(DISTINCT UserID) AS Subscribers
FROM brightlearn.data.tv_user_profile
GROUP BY Province
ORDER BY Subscribers DESC;



---How many unique subscribers are in the dataset?
SELECT COUNT(DISTINCT UserID) AS TotalSubscribers
FROM brightlearn.data.tv_user_profile;

--Which hour of the day has the highest viewing activity?

SELECT
  HOUR(`RecordDate2`) AS hour_of_day,
  COUNT(*) AS total_sessions,
  ROUND(SUM(
    HOUR(`Duration 2`) * 3600 +
    MINUTE(`Duration 2`) * 60 +
    SECOND(`Duration 2`)
  ) / 3600.0, 2) AS total_watch_time_hours
FROM `brightlearn`.`data`.`tv_viewership`
GROUP BY hour_of_day
ORDER BY total_sessions DESC
LIMIT 5;