CREATE PROCEDURE dbo.AddTLToList2Nav @NumML int,  
    @Zakazhcik   nvarchar(255) 

AS

set nocount on 

Insert Into dbo.List2Nav ([NumML],[Zakazhcik]) Values (@NumML,@Zakazhcik)