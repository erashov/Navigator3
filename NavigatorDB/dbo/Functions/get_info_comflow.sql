CREATE FUNCTION get_info_comflow (@ml int)
RETURNS @tab TABLE(Id int, sCode varchar(32))
WITH EXECUTE AS SELF
AS
begin
insert into @tab select top 1 Id, sCode from Comflow.dbo.TheService
RETURN 
end


GO
GRANT SELECT
    ON OBJECT::[dbo].[get_info_comflow] TO PUBLIC
    AS [dbo];

