with dedup as (

    select *,
           row_number() over (
               partition by product_id
               order by product_id
           ) as rn
    from {{ source('kaggle_raw', 'DIM_PRODUCTS') }}

)

select *
from dedup
where rn = 1