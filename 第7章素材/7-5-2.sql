CREATE TABLE browse_statistics (
    uid            bigint,
    age_range       int4range,
    location       point,
    history_stat  jsonb not null default '{}',
    info            text, 
    crt_time       timestamp
);
insert into browse_statistics(uid,info,crt_time) select generate_series(1,100000), md5(random()::text), clock_timestamp();
