CREATE TABLE browse_statistics (
    uid            bigint,
    age_range       int4range,
    location       point,
    history_stat  jsonb not null default '{}',
    info            text, 
    crt_time       timestamp
);
CREATE OR REPLACE FUNCTION insert_table(v_count int)
RETURNS integer AS
$BODY$
declare
v_idx integer=1;
begin
while v_idx<v_count loop
insert into browse_statistics(uid,age_range,location,history_stat)
select v_idx,
int4range((v_idx%60),(random()*10+v_idx%60)::int),
point(round((random()*1000)::numeric, 2), round((random()*1000)::numeric, 2)),
jsonb_build_object('FASHION_BRANDS_TOP',substr('abcdefghijklmnopqrstuvwxyz',(random()*23)::integer,3),'COSMETICS_BRANDS_TOP','Whoo','SPORTWARE_BRANDS_TOP','Nike','PAGE_VIEWS_FOR_THE_YEAR',(random()*210000)::int,'BUYTIMES_FOR_THE_YEAR',1000000,'SPENDING_FOR_THE_YEAR', 100234.23);
v_idx=v_idx+1;
end loop;
RETURN v_idx;
end
$BODY$
language plpgsql;
select insert_table(100000);  