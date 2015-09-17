create  PROCEDURE [dbo].[ML_Z_Load] @NumML int, @Attr nvarchar(20)
AS

set nocount on 

SELECT AttrValue 

FROM dbo.AttributeMLExtra
WHERE NumML =@NumML
and AttrName = @Attr