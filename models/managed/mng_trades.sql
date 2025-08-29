{{ config(
    materialized='table',
    schema='managed'
) }}

select
row_number()over(order by TRADE_ID) as trade_sk
,trade_id	
,trade_version	
,trade_date	
,isin	
,lower(side) as side
,quantity	
,price	
,trade_value	
,trader_id
from DBTLEARN.PUBLIC.TRADES_LOAD