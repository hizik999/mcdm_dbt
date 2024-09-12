[Source repo](https://github.com/technomonah/dbt_mcdm_challenge?tab=readme-ov-file)
[Looker Studio dashboard](https://lookerstudio.google.com/reporting/ba84c735-54ad-453e-85c6-cebfe99eb95d)
## Used tools 
- dbt Cloud
- Google Big Query
- Google Looker Studio

## How to add data from new ad platforms
1. Add source file to seeds or load to DWH
2. Add file name to \_ads_sources.yml
like this
```yml
version: 2

sources:
- name: ads
	database: dbt-test-435309
	schema: test
	tables:
		- name: ads_twitter
		- name: ads_tiktok
		- name: ads_facebook		
		- name: ads_bing
		- name: ADDED_SOURCE_FILE_NAME
```
3. Create new staging file in models/staging/FILE_NAME.sql
4. Wtite into it the code that will satisfy the structure of MCDM (replace nulls and missing columns with the 0-columns with same names). Configure all calculated columns here. 
like this
```sql
WITH tiktok AS (
	SELECT
		ad_id,
		0 AS add_to_cart,
		0 AS adset_id,
		campaign_id,
		channel,
		clicks,
		0 AS comments,
		0 AS creative_id,
		date,
		clicks + add_to_cart + purchase + registrations + video_views AS engagements, 
		impressions,
		0 AS installs,
		0 AS likes,
		0 AS link_clicks,
		0 AS placement_id,
		0 AS post_click_conversions,
		0 AS post_view_conversions,
		0 AS posts,
		purchase,
		registrations,
		0 AS revenue,
		0 AS shares,
		spend,
		conversions,
		video_views
	FROM {{ source('ads', 'ads_tiktok') }}
) 

SELECT * FROM tiktok
```
5. Add to models/core/mcdm.sql UNION ALL into mcdm cte and write select from added model 
like this
```sql
WITH mcdm AS (
	SELECT
		*
	FROM {{ ref('ads_tiktok') }}
	
	UNION ALL

	SELECT
		*
	FROM {{ ref('ads_facebook') }}
	
	UNION ALL
	
	SELECT
		*
	FROM {{ ref('ads_twitter') }}
	
	UNION ALL
	
	SELECT
		*
	FROM {{ ref('ads_bing') }}	

	UNION ALL 
	
	SELECT 
		*
	FROM {{ ref('ADDED_MODEL_NAME') }} 
)

SELECT * FROM mcdm
```
6. If you need to calculate some more metrics, you can add them in models/core/mcdm_with_metrics.sql file
7. A new data source is added, you are great!