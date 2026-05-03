select
    customer_id,
    upper(trim(customer_name)) as customer_name
from {{ source('kaggle_raw', 'DIM_CUSTOMERS') }}
where customer_id is not null