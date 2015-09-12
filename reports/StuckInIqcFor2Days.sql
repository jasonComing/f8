-- ��f2�ѥ��J�w����
SELECT dep.cDepName AS [��?], m.dDate AS [��?���], getdate() AS [����], datediff(d, getdate(), m.dDate) as [��?], 
d.csocode AS [JOB], m.cCode AS [��?��???], d.cInvCode AS [�s???], i.cInvName AS [�s?�W?], d.iQuantity AS [?�q],d.fValidInQuan AS [�X��~�J??�q]
FROM PU_ArrivalVouch m
JOIN PU_ArrivalVouchs d ON m.ID = d.ID
join Inventory i on i.cInvCode = d.cInvCode
join PO_Pomain po on po.cPOId = m.cpocode
left join Department dep on dep.cDepCode = po.cDepCode
where m.dDate <= dateadd(d, -2, getdate())
and d.iQuantity != d.fValidInQuan
order by dep.cDepName, m.dDate desc, m.cCode