select
    channel,
    round(sum(spend) / sum(engagements), 2) as engagement_cost,
    round(sum(spend) / sum(conversions), 0) as conversion_cost,
    sum(impressions) as impressions,
    round(sum(spend) / sum(clicks), 2) as cpc
from {{ ref("mcdm") }}
group by channel
