select
    row_number() over (order by product_id) as product_key,
    product_id,
    product_name

from {{ ref('stg_products') }}
where product_id is not null

union all

select
    0 as product_key,
    'UNKNOWN' as product_id,
    'Unknown Product' as product_name