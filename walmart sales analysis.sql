--Q1)Which individual Walmart store generated the highest total overall revenue across the 3-year period?
select * from walmart_sales;
select store, (sum(weekly_sales),2) as total_revenue
from walmart_sales
group by store
order by total_revenue desc
limit 3;

--Q2)  Which store generated the lowest total sales revenue, highlighting potential operational underperformance?
select store,  (sum(weekly_sales),2) as total_revenue
from walmart_sales
group by store
order by total_revenue
limit 3;

--Q3) What is the average weekly revenue difference between holiday weeks and non-holiday weeks?
select holiday_flag, ROUND(avg(weekly_sales),2) as Average_holiday_flag
from walmart_sales
group by holiday_flag

--Q4) What was the highest single-week sales total ever recorded by a store, and on what date did it occur?
select store,
date, (ROUND(weekly_sales),2) as peak_weekly_sales
from walmart_sales
order by weekly_sales desc
limit 3;

--Q5) Which calendar month consistently produces the highest average weekly sales per store?
SELECT 
    EXTRACT(MONTH FROM TO_DATE(date,'DD-MM-YYYY')) AS month_number,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM walmart_sales
GROUP BY month_number
ORDER BY avg_weekly_sales DESC
Limit 3;

--Q6) Which store experiences the highest sales variance/standard deviation, representing higher operational and inventory risk
SELECT 
    store,
    ROUND(STDDEV(weekly_sales), 2) AS sales_std_dev
FROM walmart_sales
GROUP BY store
ORDER BY sales_std_dev DESC
LIMIT 1;

--Q7) How do extreme high temperatures (>85°F) impact average weekly sales compared to moderate weather (32°F - 85°F)?
Select 
case 
when temperature >85 then 'HOT'
when temperature <32 then 'Frezzing'
else 'Moderate'
End as temp_category,
Round(avg(weekly_sales),2) as avg_weekly_sales
from walmart_sales
group by temp_category

--Q8) What is the sales disparity between stores located in high unemployment zones (>10%) versus lower unemployment zones?
select 
case 
when unemployment>10 then 'High unemployment'
else 'low/moderate unemployment<=10'
end as unemployment_category,
round(avg(weekly_sales),2) as avg_weekly_sales
from walmart_sales
group by unemployment_category;

--Q9) Which full calendar year recorded the highest total gross sales revenue across all stores?
select 
EXTRACT(year FROM TO_DATE(date,'DD-MM-YYYY')) AS Years,
round(sum(weekly_sales),2) as total_yearly_sales
from walmart_sales
group by years
order by total_yearly_sales desc;

--Q10) What percentage of Walmart's overall multi-billion dollar revenue is contributed by just the Top 5 stores?
WITH store_totals AS (
    SELECT store, SUM(weekly_sales) AS store_rev
    FROM walmart_sales
    GROUP BY store
),
top_5 AS (
    SELECT SUM(store_rev) AS top_5_rev
    FROM (SELECT store_rev FROM store_totals ORDER BY store_rev DESC LIMIT 5) sub
)
SELECT 
    ROUND(top_5.top_5_rev, 2) AS top_5_revenue,
    ROUND(SUM(s.store_rev), 2) AS overall_total_revenue,
    ROUND((top_5.top_5_rev / SUM(s.store_rev)) * 100, 2) AS pct_of_total_revenue
FROM store_totals s, top_5
GROUP BY top_5.top_5_rev;


