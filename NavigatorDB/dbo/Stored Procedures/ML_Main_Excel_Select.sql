CREATE PROCEDURE dbo.ML_Main_Excel_Select @NumML int

AS






set nocount on 

select excel,excel1 from dbo.ML_Main
where numml = @NumML and excel is not null