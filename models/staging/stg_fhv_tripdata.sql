{{ config(materialized='view') }}


select
    -- identifiers
        dispatching_base_num,
        cast(pulocationid as integer) as  pickup_locationid,
        cast(dolocationid as integer) as dropoff_locationid,
        
        -- timestamps
        cast(pickup_datetime as timestamp) as pickup_datetime,
        cast(pickup_datetime as timestamp) as dropoff_datetime,
        
        -- trip info
        sr_flag
from {{ source('staging','fhv_tripdata') }}

