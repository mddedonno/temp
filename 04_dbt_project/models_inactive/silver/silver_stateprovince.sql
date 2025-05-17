

with stateprovince as (
    select
        *
    from {{ ref('bronze_stateprovince') }}
)
select *
from stateprovince
