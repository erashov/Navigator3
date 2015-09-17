CREATE PROCEDURE dbo.ML_Equipment_Directory_INSERT @UnitId int,
                                                    @Equipment nvarchar (500),
                                                    @SerialNum nvarchar(255),
                                                    @CostOne     decimal(19,2),
                                                    @Designation nvarchar(255)
                                                  
AS

set nocount on 
INSERT INTO dbo.ML_Equipment_Directory
([UnitId],[Equipment],[SerialNum],[CostOne],[Designation]) VALUES (@UnitId, @Equipment,@SerialNum, @CostOne, @Designation)