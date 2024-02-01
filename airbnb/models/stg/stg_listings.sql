with src_listings as (
    select * from {{ref("src_listings")}}
)
select
    listing_id,
    listing_name,
    listing_url,
    case 
        when room_type = 'Entire home/apt' then 'Appartment' 
        else room_type 
    end room_type,
    case 
        when minimum_nights = 0 then 1
        else minimum_nights 
    end minimum_nights,
    host_id,
    replace(price_str, '$')::number(10,2) price,
    created_at,
    updated_at
from src_listings
