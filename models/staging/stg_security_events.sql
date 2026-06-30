select
    event_id,
    cast(timestamp as timestamp) as event_timestamp,
    source_ip,
    event_type,
    username,
    status,
    country,
    extract(hour from cast(timestamp as timestamp)) as event_hour
from {{ ref('raw_security_events') }}
