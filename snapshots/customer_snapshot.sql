{% snapshot customer_snapshot %}

{{
    config(
        target_schema='DBT_BRANGISETTI',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select
    customer_id,
    customer_name,
    updated_at
from {{ source('kaggle_raw', 'DIM_CUSTOMERS') }}

{% endsnapshot %}