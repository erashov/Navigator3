
/*
CREATE PROCEDURE <Schema_Name, sysname, Schema_Name>.<Procedure_Name, sysname, Procedure_Name>
	<@param1, sysname, @p1> <datatype_for_param1, , int> = <default_value_for_param1, , 0>, 
	<@param2, sysname, @p2> <datatype_for_param2, , int>  OUTPUT
AS
	SELECT @p2 = @p2 + @p1
GO
*/

CREATE procedure [dbo].[proc_return_str] AS

-- DECLARE @param_to_return nvarchar(254);

select 
	count(*)
from
	Osnova
where
	NumML > 78700

-- return @param_to_return