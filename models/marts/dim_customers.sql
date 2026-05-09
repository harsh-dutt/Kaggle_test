select
    -- surrogate key
    row_number() over (order by customer_id) as customer_key,

    customer_id,
    customer_name

from {{ ref('stg_customers') }}
where customer_id is not null

union all

-- 👇 UNKNOWN row (always present)
select
    0 as customer_key,
    'UNKNOWN' as customer_id,
    'Unknown Customer' as customer_name