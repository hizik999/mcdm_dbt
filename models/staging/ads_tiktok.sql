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
    FROM {{ source('ads', 'source_ads_tiktok') }}
)

SELECT * FROM tiktok
