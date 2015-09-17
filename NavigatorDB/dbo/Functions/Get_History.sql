



CREATE FUNCTION [dbo].[Get_History] (@ml int)
RETURNS TABLE
AS
RETURN 
(
select Wfl_tasks.id, CONVERT(varchar(10),StartDate, 104)+' '+CONVERT(varchar(10),StartDate, 108) as StartDate, df.DeptName as DeptFrom, dt.DeptName as DeptTo, TaskComment+' '+Report as TaskComment,
case 
      when CancelDate is not null then 'Отменено:'+ CONVERT(varchar(10),CancelDate, 104)+' '+CONVERT(varchar(10),CancelDate, 108)+' '+CancelUser+' '+CancelReason
      when ReturnDate is not null then 'Возвращено:'+CONVERT(varchar(10),ReturnDate, 104)+' '+CONVERT(varchar(10),ReturnDate, 108)+' '+ReturnUser+': '
                 + case when wfl_tasks.MainTaskForStep=1 then (select isnull(name, '') from dbo.ReturnReasonObr where id=isnull(wfl_tasks.ReturnReasonId, 0)) 
                        when wfl_tasks.MainTaskForStep=2 then (select isnull(name, '') from dbo.ReturnReasonIsp where id=isnull(wfl_tasks.ReturnReasonId, 0)) 
                        else ''
                   end
                +  case when isnull(wfl_tasks.ReturnComment, '')!='' then '('+wfl_tasks.ReturnComment+')' 
                        else ''
                   end 
      when TaskResult=0 then 'Отменено исполнителем:'+CONVERT(varchar(10),EndDate, 104)+' '+CONVERT(varchar(10),EndDate, 108)+' '+UserDo--+' '+Report
      when TaskResult=1 then 'Выполнено:'+CONVERT(varchar(10),EndDate, 104)+' '+CONVERT(varchar(10),EndDate, 108)+' '+UserDo--+' '+Report
 end as Status_task,
 CONVERT(varchar(10),GetTaskDate, 104)+' '+CONVERT(varchar(10),GetTaskDate, 108) as GetTaskDate,  
 CONVERT(varchar(10),EndDate, 104)+' '+CONVERT(varchar(10),EndDate, 108) as EndDate   
 from Wfl_tasks 
 join wfl_Depts df on df.Id=Wfl_tasks.DepartmentIdFrom
 join wfl_Depts dt on dt.Id=Wfl_tasks.DepartmentIdTo
 where NumML=@ml
 )







