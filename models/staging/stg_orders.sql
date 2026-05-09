with ranked as (

    select *,
           row_number() over (
               partition by order_id
               order by order_date desc
           ) as rn

    from {{ source('kaggle_raw', 'RAW_ORDERS') }}

)

select
    order_id,
    customer_id,
    product_id,
    order_date,
    sales

from ranked
where rn = 1