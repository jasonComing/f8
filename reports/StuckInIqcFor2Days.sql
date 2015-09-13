-- 到貨2天未入庫報表
SELECT
  dep.cDepName AS [部门], 
  m.dDate AS [到货日期],
  getdate() AS [今天],
  datediff(d, getdate(), m.dDate) as [天数], 
  d.csocode AS [JOB],
  m.cCode AS [采购到货单号],
  d.cInvCode AS [存货编码],
  i.cInvName AS [存货名称],
  d.iQuantity AS [数量],
  d.fValidInQuan AS [合格品入库数量]
FROM PU_ArrivalVouch m  
JOIN PU_ArrivalVouchs d ON m.ID = d.ID  
join Inventory i on i.cInvCode = d.cInvCode
join PO_Pomain po on po.cPOId = m.cpocode
left join Department dep on dep.cDepCode = po.cDepCode
where m.dDate <= dateadd(d, -2, getdate())
and d.iQuantity != d.fValidInQuan
order by dep.cDepName, m.dDate desc, m.cCode