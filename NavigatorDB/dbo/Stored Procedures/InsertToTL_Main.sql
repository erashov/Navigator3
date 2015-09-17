-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertToTL_Main (@NumMl int,@TaskName varchar(50),@ServiceName varchar(50),@Customer varchar(50),@BasisName varchar(50))
AS
BEGIN
INSERT INTO TL_Main(NumMl,TaskName,ServiceName,Customer,BasisName) values (@NumMl,@TaskName,@ServiceName,@Customer,@BasisName)
END
