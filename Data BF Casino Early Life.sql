---------- Eligible customers by level---------
with eligible_accounts as(
-------- Trigger Bonus Plan-------
with triggerbonus as (
select code, name 
from omni_bonus.hbf_playtech_casino_vw_bonus
WHERE name like 'TR_EL_%'
        and casinocode = 1228 
        -- BF.com 
        and name not like '%XSEL%'
        and name not like '%VC_%'
        and name not like '%REV_%'
        and name not like '%CRM_%'
        and name not like '%MC_%'
        and name not like '%AQ_%'
        and name not like '%ML_%'),
        
--------- Min date of Trigger plans per account_id---------
mindate as (
select distinct dp.username, min(pb.acceptdate) minacceptdate
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join triggerbonus tb on pb.bonuscode = tb.code
        join omni.dim_account da on da.account_id = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        --and dp.username in (10001479)
        group by dp.username)
  
select distinct dp.username, da.residence_country, acceptdate as mdate,
case    when tb.name like '%LOW%' Then 'Low'
        when tb.name like '%MED%' Then 'Med'
        when tb.name like '%HIGH%' Then 'High'
        end as tier
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join triggerbonus tb on pb.bonuscode = tb.code
        join omni.dim_account da on da.account_id = dp.username
        join mindate md on md.username = dp.username and md.minacceptdate = pb.acceptdate
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        --and dp.username in (50469073,10478230,11414045,50811386)
        group by dp.username,tb.name,da.residence_country,acceptdate)
        
---------- Eligible customers by level - END ---------
--,
--------- CRM details ---------
--
--
--
--
--------- CRM details end ---------
,
--------- Early Life bounses Day 5 ---------     
day5bon as (with bonuses as (select code, name as bonusname
from omni_bonus.hbf_playtech_casino_vw_bonus
WHERE name like 'EL_HIGH_100PEC_MTC'
        or name like 'EL_MED_100PEC_MTC'
        or name like 'EL_LOW_100PEC_MTC'
        and casinocode = 1228 ),

optin  as (
select distinct dp.username, 
case when pb.acceptdate is not null then 1
else 0 end as optedin
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        group by dp.username, pb.acceptdate),
        
quali  as 
(select distinct dp.username, 
case when sum(pb.amount)>0 then 1
else 0 end as qualified
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        group by dp.username)
        
select distinct dp.username, optedin, qualified, sum(pb.amount) as BonusAmount
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        join optin oi on oi.username = dp.username
        join quali q on q.username = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        group by dp.username, optedin, qualified)
        
--------- Early Life bounses Day 5 end --------- 
,
--------- Early Life bounses Day 8 ---------     
day8bon as (with bonuses as (select code, name as bonusname
from omni_bonus.hbf_playtech_casino_vw_bonus
WHERE name like 'EL_HIGH_APP_FS'
        or name like 'EL_MED_APP_FS'
        or name like 'EL_LOW_APP_FS'
        or name like 'EL_HIGH_10_LIVEDROP'
        or name like 'EL_MED_5_LIVEGC'
        or name like 'EL_LOW_2_LIVEGC'
        and casinocode = 1228 ),

optin  as (
select distinct dp.username, 
case when pb.acceptdate is not null then 1
else 0 end as optedin
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        group by dp.username, pb.acceptdate),
        
quali  as 
(select distinct dp.username, 
case when sum(pb.amount)>0 then 1
else 0 end as qualified
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        group by dp.username)
        
select distinct dp.username, optedin, qualified, sum(pb.amount) as BonusAmount
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        join optin oi on oi.username = dp.username
        join quali q on q.username = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        group by dp.username, optedin, qualified)
        
--------- Early Life bounses Day 8 end --------- 
,
--------- Early Life bounses Day 15 ---------     
day15bon as (with bonuses as (select code, name as bonusname
from omni_bonus.hbf_playtech_casino_vw_bonus
WHERE name like 'EL_MED_BXGY_SLOTS_BC'
        or name like 'EL_MED_BXGY_SLOTS'
        or name like 'EL_LOW_BXGY_SLOTS_BC'
        or name like 'EL_LOW_BXGY_SLOTS'
        or name like 'EL_HIGH_BXGY_BC'
        or name like 'EL_HIGH_BXGY'
        or name like 'EL_MED_LIVEB50G10'
        or name like 'EL_MED_BXGY_LIVE_BC'
        or name like 'EL_LOW_LIVEB25G5'
        or name like 'EL_LOW_BXGY_LIVE_BC'
        or name like 'EL_HIGH_LIVEB500G50'
        or name like 'EL_HIGH_BXGY_LIVE_BC'
        and casinocode = 1228 ),

optin  as (
select distinct dp.username, 
case when pb.acceptdate is not null then 1
else 0 end as optedin
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        group by dp.username, pb.acceptdate),
        
quali  as 
(select distinct dp.username, 
case when sum(pb.amount)>0 then 1
else 0 end as qualified
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        group by dp.username)
        
select distinct dp.username, optedin, qualified, sum(pb.amount) as BonusAmount
from   omni_bonus.hbf_playtech_casino_vw_pending_bonus pb
        join omni_casino.hbf_playtech_vw_player dp on dp.code = pb.playercode
        join bonuses bon on pb.bonuscode = bon.code
        join omni.dim_account da on da.account_id = dp.username
        join optin oi on oi.username = dp.username
        join quali q on q.username = dp.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and date_trunc('day',pb.acceptdate) between '2019-03-01' and '2019-03-31'
        group by dp.username, optedin, qualified)
        
--------- Early Life bounses Day 15 end --------- 
        
select distinct ea.username, da.residence_country, dp.currencycode, ea.tier, ea.mdate, d5.optedin as d5optin, d5.qualified as d5qual, min(d5.bonusamount) d5bon
, d8.optedin as d8optin, d8.qualified as d8qual, min(d8.bonusamount) d8bon, d15.optedin as d15optin, d15.qualified as d15qual, min(d15.bonusamount) d15bon

from    eligible_accounts ea
        join omni_casino.hbf_playtech_vw_player dp on ea.username = dp.username
        join omni.dim_account da on da.account_id = dp.username
        join omni_bonus.hbf_playtech_casino_vw_pending_bonus pb on dp.code = pb.playercode
        left join day5bon d5 on ea.username = d5.username
        left join day8bon d8 on ea.username = d8.username
        left join day15bon d15 on ea.username = d15.username
        where brand in ('Betfair')
        and da.residence_country in ('United Kingdom', 'Ireland')
        and ea.mdate between '2019-03-01' and '2019-03-31'
        --and dp.username in (50469073,10478230,11414045,50811386)
        group by ea.username, da.residence_country, dp.currencycode, ea.tier, ea.mdate, d5.optedin, d5.qualified, d8.optedin, d8.qualified, d15.optedin, d15.qualified