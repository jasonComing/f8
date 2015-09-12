-- ȬӦ2đżĊηӸʭ
SELECT dep.cDepName AS [ӡ?], m.dDate AS [Ȭ?ĩԁ], getdate() AS [ĵđ], datediff(d, getdate(), m.dDate) as [đ?], 
d.csocode AS [JOB], m.cCode AS [ʶ?Ȭ???], d.cInvCode AS [Ƴ???], i.cInvName AS [Ƴ?Ɨ?], d.iQuantity AS [?ֱ],d.fValidInQuan AS [ƘΦ˾Ċ??ֱ]
FROM PU_ArrivalVouch m  
JOIN PU_ArrivalVouchs d ON m.ID = d.ID  
join Inventory i on i.cInvCode = d.cInvCode 
join PO_Pomain po on po.cPOId = m.cpocode
left join Department dep on dep.cDepCode = po.cDepCode
where m.dDate <= dateadd(d, -2, getdate())
and d.iQuantity != d.fValidInQuan
order by dep.cDepName, m.dDate desc, m.cCode