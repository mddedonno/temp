

with address as (
    select
        *
    from {{ ref('bronze_address') }}
)
select *
from address
