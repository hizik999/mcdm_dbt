WITH bing AS (
    SELECT
        ad_id,
        0 AS add_to_cart,
        adset_id,
        campaign_id,
        channel,
        clicks,
        0 AS comments,
        0 AS creative_id,
        date,
        clicks + conv + imps + revenue AS engagements,
        imps AS impressions,
        0 AS installs,
        0 AS likes,
        0 AS link_clicks,
        0 AS placement_id,
        0 AS post_click_conversions,
        0 AS post_view_conversions,
        0 AS posts,
        0 AS purchase,
        0 AS registrations,
        revenue,
        0 AS shares,
        spend,
        conv AS conversions,
        0 AS video_views
    FROM {{ source('ads', 'source_ads_bing') }}
)

SELECT * FROM bing
