CREATE PROCEDURE dbo.Report_SrochFreeza @numml int
 
AS

set nocount on 

declare @id int
select @id = max(id) from ml_history
where numml = @numml and step = 8

select comment, commentary, starttime from ml_history
where id = @id