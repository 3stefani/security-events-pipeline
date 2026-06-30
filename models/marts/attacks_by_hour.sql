select
    event_hour,
    count(*) as total_events,
    sum(case when status = 'failed' then 1 else 0 end) as failed_events,
    count(distinct source_ip) as unique_ips
from {{ ref('stg_security_events') }}
group by event_hour
order by total_events desc
