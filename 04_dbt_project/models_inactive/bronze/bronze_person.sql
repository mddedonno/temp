

with person as (
    select
        *
    from {{ source('person', 'person') }}
)
select *
from person
