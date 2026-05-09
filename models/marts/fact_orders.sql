select
    o.order_id,
    o.order_date,
    o.sales,
    s.customer_name

from {{ ref('stg_orders') }} o

left join {{ ref('customer_snapshot') }} s
    on o.CUSTOMER_ID = s.CUSTOMER_ID
    and o.order_date >= s.dbt_valid_from
    and (o.order_date < s.dbt_valid_to or s.dbt_valid_to is null)