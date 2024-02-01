{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

with src_views as (
    select * from {{ref("src_reviews")}}
)
select * 
from src_views
where review_text is not null 
    and length(review_text) > 1

{% if is_incremental() %}
    and review_date > (select max(review_date) from {{ this }})
{% endif %}


