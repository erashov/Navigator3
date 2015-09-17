






CREATE FUNCTION [dbo].[get_childTasks]
    (   @ml int, @interface varchar(100)  )  
    RETURNS TABLE 
     AS RETURN
     (
        select t.Id,        --NumML, ParentId, DeptFrom, UserFrom, 
               StartDate, --TaskComment,
               d.DeptName as DeptTo,    --UserDo, EndDate, Report , TaskResult, CancelDate, CancelUser, CancelReason, 
               t.TaskType,   --, ReturnReasonId, ReturnUser, ReturnDate,ReturnComment
               case when --DepartmentIdFrom=(select Id from Wfl_Depts where replace(@interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%') 
                         ParentId in (select Wfl_Tasks.Id from Wfl_Tasks join Wfl_Depts on DepartmentIdTo=Wfl_Depts.Id 
                                                 where (replace(@interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @interface  like  '%[ ]'+Wfl_Depts.DeptInt+'%' or DeptInt=@Interface))
                         and CancelDate is null and ReturnDate is null
                    then 1
                    else 0 end as CanCancel ,
               GetTaskDate
        from   dbo.Wfl_Tasks t join dbo.Wfl_Depts d on t.DepartmentIdTo=d.Id
        where  --DeptFrom=(select DeptName from Wfl_Depts where replace(@interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%')
               --and 
               NumML=@ml and EndDate is null --and CancelDate is null and ReturnDate is null
      ) ;






