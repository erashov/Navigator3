
CREATE view [dbo].[Wfl_TaskReturns] as
select [NumML], 
	max([ReturnDate]) as TaskReturns,
	(select convert(nvarchar, MaxCancel, 104) + ' ' + ' ' +convert(nvarchar, MaxCancel, 108) + ' ' + d.[DeptName] + ',' as 'data()' 
	from (select NumMl, max(CancelDate) as MaxCancel, [DepartmentIdTo] from [dbo].[Wfl_Tasks] t2
		where [DepartmentIdFrom] > 1
		group by NumMl, [DepartmentIdTo]
		) t3
	join [dbo].[Wfl_Depts] d on t3.[DepartmentIdTo] = d.[Id] 
	where t1.[NumML]=t3.[NumML]
	order by [NumML], MaxCancel
	for xml path('')) as TaskCancels
from [dbo].[Wfl_Tasks] t1
group by [NumML]
