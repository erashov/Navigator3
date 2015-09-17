CREATE PROCEDURE dbo.AttributeMLExtra_INSERT @NumML int,
                                                @AttrName nvarchar(255),
                                                @AttrFullName nvarchar(512),
                                                @AttrValue nvarchar(512)
                                        
AS

set nocount on 
INSERT INTO AttributeMLExtra
([NumML],[AttrName],[AttrFullName],[AttrValue]) VALUES (@NumML,@AttrName,@AttrFullName,@AttrValue)