

with countryregion as (
    select
        *
    from {{ ref('bronze_countryregion') }}
)
select *
from countryregion
