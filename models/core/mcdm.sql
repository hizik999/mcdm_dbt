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
)

SELECT * FROM mcdm
