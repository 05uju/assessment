SELECT
  c.name,
  SUM(mp.cost) AS total_cost,
  SUM(mp.impressions) AS total_impressions,
  SUM(mp.clicks) AS total_clicks,
  SUM(wr.revenue) AS total_revenue
FROM campaign_info c
LEFT JOIN marketing_performance mp ON c.id = mp.campaign_id
LEFT JOIN website_revenue wr ON c.id = wr.campaign_id
GROUP BY c.name
