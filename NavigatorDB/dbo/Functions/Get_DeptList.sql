
CREATE FUNCTION [dbo].[Get_DeptList] (@interface varchar(100), @ml int)
RETURNS TABLE
AS
--declare @Dept Varchar(50)
--set @Dept=(select DeptName from Wfl_Depts where replace(@interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%')
RETURN
(
select * from Wfl_Depts 
where 
	(-- ГОМЛ - все кроме Comflow, себя и ОТР и УШТУ-опер
		replace(@interface,' ','') like  '%[_]UDU%' 
		--replace(@interface,' ','') like  '%USHTU%[0-9][0-9].mdb%' 
			and ParentDept is null 
			and id>0 
			and (replace(@interface,' ','') not like  '%[_]'+Wfl_Depts.DeptInt+'%'  
			and @interface not like  '%[ ]'+Wfl_Depts.DeptInt+'%')
			and DeptInt not like 'OKTR'
	)
	or 
	(-- Не ГОМЛ - все кроме Comflow, ГОМЛ, ОТР, себя и своего родителя 
		replace(@interface,' ','') not like  '%[_]UDU%' 
		and TaskType is not null 
		and 
		(-- Можно отбирать только "независимые" подр. (без ParentDept) или подчинённые нам
			isnull(ParentDept, '')=(
				select id from Wfl_Depts 
				--where (replace(@interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' 
				--	or @interface like  '%[ ]'+Wfl_Depts.DeptInt+'%'))
								where (@interface=Wfl_Depts.DeptInt
					or @interface=Wfl_Depts.DeptInt))
			or ParentDept is null
		)
		-- убираем из выдачи родителя
		and id!=(select isnull(ParentDept, '') from Wfl_Depts 
			--where (replace(@interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%'  
			--	or @interface like  '%[ ]'+Wfl_Depts.DeptInt+'%'))
			where (@interface=Wfl_Depts.DeptInt
				or @interface=Wfl_Depts.DeptInt))
		-- убираем из выдачи себя
		--and (replace(@interface,' ','') not like  '%[_]'+Wfl_Depts.DeptInt+'%'  
		--		and @interface not like  '%[ ]'+Wfl_Depts.DeptInt+'%')
				and (@interface <> Wfl_Depts.DeptInt
				and @interface <> Wfl_Depts.DeptInt)
		-- для ОТР можно только ТО и то подр., которое выдало незакрытое задание в ОТР по данному МЛ
		and	(replace(@interface,' ','') not like  '%[_]OKTR%' 
			or
			(replace(@interface,' ','') like  '%[_]OKTR%' 
				and (DeptName='ТО' 
					or Wfl_Depts.Id=(select DepartmentIdFrom from Wfl_Tasks 
										where DepartmentIdTo=(select value from Wfl_Settings 
															where Code='FinalRouteSheetValidator') 
												and NumML=@ml and CancelDate is null 
												and EndDate is null and ReturnDate is null))
			)
		)
	)
)
