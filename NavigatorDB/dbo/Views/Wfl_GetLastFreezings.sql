CREATE VIEW [dbo].[Wfl_GetLastFreezings]
	AS 
select top 1 with ties fr.*
from [dbo].[Wfl_RouteSheetFreezings] fr
order by row_number() OVER(PARTITION BY fr.[RSNumber] order by fr.[StartDate] desc)