

with countryregion as (
    select
        *
    from {{ source('person', 'countryregion') }}
)
select *
from countryregion
