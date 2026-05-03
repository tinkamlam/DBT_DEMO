WITH TRIPS as (
    select
    RIDE_ID,
    RIDEABLE_TYPE,
    TO_TIMESTAMP(started_at) as TRIP_DATE,
    START_STATIO_ID as START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL as MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10
)
select 
* from TRIPS