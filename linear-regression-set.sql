use database bookbub;

with 

mailings_in_scope as (
select 
  id as mailing_id,
  mailing_date 
from 
  hedwig.mailings 
where 
  mailing_date between '2026-01-01' and '2026-05-01'
),

human_opens as (
select distinct
  user_id,
  mailing_id 
from 
  bookbub_etl.deal_email_action_open_clean o 
where 
  exists (select null from mailings_in_scope mis where mis.mailing_id = o.mailing_id)
  and not is_machine_user_agent(data:useragent)
),

num_promos as (
select 
  user_id,
  mailing_id,
  max(promotion_position) as n_promos
from 
  consumer_insights.bb_deals_promotion_positions_mv pos 
where 
  exists (select null from human_opens h where h.user_id = pos.user_id and h.mailing_id = pos.mailing_id)
group by 
  user_id,
  mailing_id  
),

ebv as (
select
  h.user_id,
  h.mailing_id,
  sum(case
        when rc.user_id is not null and deal_price_cents = 0
          then 3.6
        when rc.user_id is not null and deal_price_cents <= 99
          then 28.0
        when rc.user_id is not null and deal_price_cents <= 199
          then 51.0
        when rc.user_id is not null and deal_price_cents <= 299
          then 70.0
        when rc.user_id is not null 
          then 72.0
        else
          0.0
     end) as expected_book_value
from
  human_opens h
  left join bookbub_analytics.retailer_clicks rc
    on rc.mailing_id = h.mailing_id
	and rc.user_id = h.user_id
  left join lello.users u
    on u.id = rc.user_id
  left join lello.regionings reg
    on reg.region_id = u.region_id
	and reg.promotion_id = rc.promotion_id
    and reg.region_id = u.region_id
group by
  h.user_id,
  h.mailing_id
),

joined as (
select 
  e.user_id,
  e.mailing_id,
  p.n_promos,
  e.expected_book_value
from 
  ebv e 
  join num_promos p 
    on e.user_id = p.user_id
    and e.mailing_id = p.mailing_id
)

select * from joined;

