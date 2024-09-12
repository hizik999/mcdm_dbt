WITH twitter AS (
    SELECT
        0 AS ad_id,
        0 AS add_to_cart,
        0 AS adset_id,
        campaign_id,
        channel,
        clicks,
        comments,
        0 AS creative_id,
        date,
        engagements,
        impressions,
        0 AS installs,
        likes,
        0 AS link_clicks,
        0 AS placement_id,
        0 AS post_click_conversions,
        0 AS post_view_conversions,
        0 AS posts,
        0 AS purchase,
        0 AS registrations,
        0 AS revenue,
        0 AS shares,
        spend,
        engagements AS conversions,
        video_total_views AS video_views
    FROM {{ source('ads', 'source_ads_twitter') }}
)

SELECT * FROM twitter
