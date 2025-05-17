

with address as (
    select
        *
    from {{ source('person', 'address') }}
)
select *
from address
