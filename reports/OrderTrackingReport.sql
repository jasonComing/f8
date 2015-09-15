-- First, get the sales orders that we have to consider
select sod.cSOCode, sod.cInvCode, sum(iQuantity) as Quantity
into #SalesOrders
from SO_SOMain som
join SO_SODetails sod on sod.cSOCode = som.cSOCode
where cCloser is null -- not closed
and iStatus = 1 -- approved
group by sod.cSOCode, sod.cInvCode

/*
-- Find all 到貨單
select pud.csocode, pud.cInvCode, sum(pud.iQuantity) as Quantity
into #Arrivals
from PU_ArrivalVouchs pud
join PU_ArrivalVouch pum on pum.ID = pud.ID
join #SalesOrders so on so.cSOCode = pud.csocode
where pum.cverifier is not null  -- approved
group by pud.csocode, pud.cInvCode
*/

if exists(select *  from sysobjects where name='hy_fz_tmpMaterial_F8 ' ) drop table hy_fz_tmpMaterial_F8
if exists(select *  from sysobjects where name='hy_fz_tmpProduct_F8 ' ) drop table hy_fz_tmpProduct_F8
if exists(select *  from sysobjects where name='hy_fz_tmpSotemp1_F8 ' ) drop table hy_fz_tmpSotemp1_F8
if exists(select *  from sysobjects where name='hy_fz_tmpSoseq_F8 ' ) drop table hy_fz_tmpSoseq_F8

-- Pass in the isosids
exec SA_GetOrderTraceBom '2015-09-01','''1000000002'',''1000000001'',''1000000003'',''1000000004'',''1000000005'',''1000000006'',''1000000007'',''1000000008'',''1000000009'',''1000000010'',''1000000011'',''1000000012'',''1000000013'',''1000000014'',''1000000015'',''1000000016'',''1000000017'',''1000000018'',''1000000019''','[hy_fz_tmpMaterial_F8]','[hy_fz_tmpProduct_F8]','[hy_fz_tmpSotemp1_F8]','[hy_fz_tmpSoseq_F8]'

select * from hy_fz_tmpMaterial_F8