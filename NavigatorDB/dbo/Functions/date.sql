

CREATE function [dbo].[date] (@d datetime) -- возвращает дату в формате "dd.mm.yy hh:mi(24)"
RETURNS NVARCHAR(35)
AS 
BEGIN 
RETURN
(
  convert(nvarchar(30), @d, 4)+' '+cast(convert(nvarchar(30),@d, 8)as nvarchar(5))
)  
END


