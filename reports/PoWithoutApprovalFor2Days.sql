SELECT dep.cDepName as [部门],
  datediff(d, dPODate, getdate()) AS [天数],
  po.dPODate AS [单据日期],
  po.cVerifier AS [审核人],
  po.cState AS [状态],
  po.cPOID AS [採购订单号]
FROM PO_Pomain po
join Department dep on dep.cDepCode = po.cDepCode
where cState != 1
and datediff(d, dPODate, getdate()) >= 2
order by dep.cDepName, datediff(d, dPODate, getdate()) desc