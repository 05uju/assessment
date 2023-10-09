-- Step 1: Get the campaign ID for "Campaign5" from the campaign_info table
SELECT campaign_id
FROM campaign_info
WHERE name = 'Campaign5';

-- Step 2: Get the number of conversions by state for Campaign5 from marketing_performance and website_revenue
WITH Conversions AS (
    SELECT mp.state, SUM(mp.conversions) AS total_conversions
    FROM marketing_performance AS mp
    JOIN campaign_info AS ci ON mp.campaign_id = ci.campaign_id
    WHERE ci. name = 'Campaign5'
    GROUP BY mp.state
)
SELECT c.state, c.total_conversions
FROM Conversions c
WHERE c.total_conversions = (
    SELECT MAX(total_conversions)
    FROM Conversions
);
