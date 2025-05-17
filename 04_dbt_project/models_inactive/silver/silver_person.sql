

with person as (
    select
        *
    from {{ ref('bronze_person') }}
)
select *
from person
