{{
    config(
        materialized = 'view'
    )
}}


WITH src_hosts AS (
    SELECT 
        * 
    FROM 
        {{ ref('src_hosts') }}
)

SELECT
    host_id,
    COALESCE(host_name, 'Anonymous')::TEXT as host_name, 
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts