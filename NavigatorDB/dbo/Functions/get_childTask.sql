




CREATE FUNCTION [dbo].[get_childTask]
    (   @TaskId int  )  
    RETURNS TABLE AS  RETURN     
     with  NavML (id, NumML, ParentId, TaskName, GetTaskDate, EndDate, Level)
AS
(
select t.id, t.NumML, t.ParentId, 
	case when t.TaskType=1 then 
			case when (t.DepartmentIdFrom=(select Value from Wfl_WorkflowSettings where code like 'PrimaryRouteSheetProcessor')
					and dt.CanBeRouteSheetResponsible is not null)
					
					or (t.DepartmentIdFrom=(select Value from Wfl_WorkflowSettings where code like 'PrimaryRouteSheetProcessor') and  t.DepartmentIdFrom=(select Value from wfl_Settings where code like 'FinalRouteSheetValidator'))
				--or t.DepartmentIdTo in (select value from wfl_Settings where code in ('PrimaryRouteSheetProcessor','FinalRouteSheetValidator'))
			then dt.DeptName+'/'+convert(varchar(10), StartDate, 104)
			else 'Окончание А/'+dt.DeptName+'/'+convert(varchar(10), StartDate, 104) 
			end
        when t.TaskType=2 
			then 'Окончание B/'+dt.DeptName+'/'+convert(varchar(10), StartDate, 104)
            else dt.DeptName+'/'+convert(varchar(10), StartDate, 104) 
	end +
        case when CancelDate is not null then ' (На Отмену)'
			when ReturnDate is not null then ' (На Возврат)'
			else ''
        end as TaskName, 
        t.GetTaskDate,
        t.EndDate,
        0 as Level
    from wfl_tasks t join wfl_depts df on t.DepartmentIdFrom=df.Id
                     join wfl_depts dt on t.DepartmentIdTo=dt.Id
    where ParentId=@TaskId --and   EndDate is null --and CancelDate is null
    UNION ALL
select t.id, t.NumML, t.ParentId,
       case when t.TaskType=1 then 
       case when (t.DepartmentIdFrom=(select Value from Wfl_WorkflowSettings where code like 'PrimaryRouteSheetProcessor')
                            and dt.CanBeRouteSheetResponsible is not null) 
                            or t.DepartmentIdTo in (select Value from Wfl_WorkflowSettings where code like 'PrimaryRouteSheetProcessor' ) then 
                            dt.DeptName+'/'+convert(varchar(10), StartDate, 104)
                      else 'Окончание А/'+dt.DeptName+'/'+convert(varchar(10), StartDate, 104) 
                 end
            when t.TaskType=2 then 
                            'Окончание B/'+dt.DeptName+'/'+convert(varchar(10), StartDate, 104)
            else dt.DeptName+'/'+convert(varchar(10), StartDate, 104) end +
            case when CancelDate is not null then ' (На Отмену)'
                 when ReturnDate is not null then ' (На Возврат)'
                 else ''
            end as TaskName ,
            t.GetTaskDate,
            t.EndDate,
      Level+1
    from wfl_tasks t join wfl_depts df on t.DepartmentIdFrom=df.Id
                     join wfl_depts dt on t.DepartmentIdTo=dt.Id
                     inner join NavML on t.ParentId=NavML.Id
	where --t.EndDate is null --and CancelDate is null and
    Level<100 
 )
select * from NavML where EndDate is null
               ;
