with src_hosts as (
    select * from {{ref("src_hosts")}}
    -- where host_name is null
)
select 
    host_id,
    coalesce(host_name, 'Anonymous') host_name,
    is_superhost,
    created_at,
    updated_at
from src_hosts
