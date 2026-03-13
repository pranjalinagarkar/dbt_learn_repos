with CTELatestTrade as (
    Select * 
    ,row_number()over(partition by trade_id order by trade_version desc) as rn
    from {{ ref('mng_trades') }}
)
select * from CTELatestTrade
where rn=1