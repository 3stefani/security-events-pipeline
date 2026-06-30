select
    source_ip,
    country,
    count(*) as total_events,
    sum(case when status = 'failed' then 1 else 0 end) as failed_attempts,
    count(distinct event_type) as attack_types_used
from {{ ref('stg_security_events') }}
group by source_ip, country
having failed_attempts >= 3
order by failed_attempts desc
