







CREATE FUNCTION [dbo].[get_MyTask]
    (   @NumML int, @Interface varchar(100) )  
    RETURNS TABLE AS  RETURN     
(
select wt.* , df.DeptName DeptFrom,  dt.DeptName DeptTo,
	   case when wt.MainTaskForStep=2 then 1 else 0 end as OU,
	   case when wt.TaskType=1 then 
				 case when (wt.MainTaskForStep is not null) then 
							df.DeptName+'/'+convert(varchar(10), wt.StartDate, 104)+' '+convert(varchar(10), wt.StartDate, 108)
					  else 'Окончание А/'+df.DeptName+'/'+convert(varchar(10), wt.StartDate, 104)+' '+convert(varchar(10), wt.StartDate, 108)
				 end
			when wt.TaskType=2 then 
							'Окончание B/'+df.DeptName+'/'+convert(varchar(10), wt.StartDate, 104)+' '+convert(varchar(10), wt.StartDate, 108)
			else df.DeptName+'/'+convert(varchar(10), wt.StartDate, 104)+' '+convert(varchar(10), wt.StartDate, 108) end
			+
			case when wt.CancelDate is not null then ' (Отменяется)'+
				 case when wt.CancelReason is not null then '  :  '+ wt.CancelReason else '' end
				 when wt.ReturnDate is not null then ' (Возвращено '+convert(varchar(10), wt.ReturnDate, 104)+' '+convert(varchar(10), wt.ReturnDate, 108)+')'     
			else ''
			end
			+ 
			case when wt_ch.ReturnDate is not null then ' (Возвращено '+dt_ch.DeptName+') :  ' 
				+(select isnull(name, '') from dbo.ReturnReasonIsp where id=wt_ch.ReturnReasonId)
				+(case when wt_ch.ReturnComment is not null then '('+wt_ch.ReturnComment+')' else '' end) 
				else '' end
			+
			case  when wt.CancelDate is not null then ' - '+convert(varchar(10), wt.CancelDate, 104)+' '+convert(varchar(10), wt.CancelDate, 108) else '' end
			+
			case  when wt_ch.ReturnDate is not null then ' - '+convert(varchar(10), wt_ch.ReturnDate, 104)+' '+convert(varchar(10), wt_ch.ReturnDate, 108) else '' end
			as  TaskName,
		case when wt_ch.ReturnDate is not null then dt_ch.DeptName 
			 else null end as ReturnOU,
		case when wt_ch.ReturnDate  is not null then wt_ch.EndDate 
			 when wt.ReturnDate is not null then wt.EndDate 
			 else null end as ch_EndDate    
from Wfl_Tasks wt
left join Wfl_Tasks wt_ch on wt_ch.MainTaskForStep=2 and wt.id=wt_ch.ParentId and wt_ch.id=(select max(id) from Wfl_Tasks where ParentId=wt.id and Wfl_Tasks.MainTaskForStep=2)
join Wfl_Depts df on wt.DepartmentIdFrom=df.Id
join Wfl_Depts dt on wt.DepartmentIdTo=dt.Id
left join Wfl_Depts dt_ch on dt_ch.Id=wt_ch.DepartmentIdTo
 where 
--wt.DepartmentIdTo in (select Id from Wfl_Depts where ((replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @Interface like  '%[ ]'+Wfl_Depts.DeptInt+'%') and @Interface is not null) or (DeptInt is null and @Interface is null))
wt.DepartmentIdTo in (select Id from Wfl_Depts where ((@Interface=Wfl_Depts.DeptInt or @Interface=+Wfl_Depts.DeptInt) and @Interface is not null) or (DeptInt is null and @Interface is null))
and wt.NumML=@NumML
and wt.EndDate is null 
)
;
