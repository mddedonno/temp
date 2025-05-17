

with stateprovince as (
    select
        *
    from {{ source('person', 'stateprovince') }}
)
select *
from stateprovince
