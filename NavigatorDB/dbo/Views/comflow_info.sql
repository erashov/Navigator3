CREATE VIEW [dbo].[comflow_info]
AS
select  s.*, n.NumML 
from Comflow.dbo.TheService s 
left join ComFlow.dbo.Navigator_test_numML n 
on  n.TheServiceId=s.Id

GO
GRANT SELECT
    ON OBJECT::[dbo].[comflow_info] TO PUBLIC
    AS [dbo];

