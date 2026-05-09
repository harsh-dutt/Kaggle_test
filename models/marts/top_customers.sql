select
    c.customer_name,
    sum(f.sales) as total_sales,
    count(f.order_id) as total_orders

from {{ ref('fact_orders') }} f

join {{ ref('dim_customers') }} c
    on f.customer_key = c.customer_key

group by c.customer_name
order by total_sales desc