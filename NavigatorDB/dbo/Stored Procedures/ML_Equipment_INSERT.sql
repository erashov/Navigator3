CREATE PROCEDURE dbo.ML_Equipment_INSERT @NumML int
                                   
                                        
AS

set nocount on 
INSERT INTO ML_Equipment
([NumML]) VALUES (@NumML)