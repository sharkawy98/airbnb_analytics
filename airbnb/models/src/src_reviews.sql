with raw_reviews as (
    select * from AIRBNB.RAW.RAW_REVIEWS
)
select 
    listing_id,
    date review_date,
    reviewer_name,
    comments review_text,
    sentiment review_sentiment
from raw_reviews