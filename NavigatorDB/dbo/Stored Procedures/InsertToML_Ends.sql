-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertToML_Ends (@NumMl int,@Okonchanie varchar(25),@Styk varchar(100),@Status_Styka varchar(100),@Line_Priv varchar(100),@Adres varchar(255),@Dop varchar(1024))
AS
BEGIN
INSERT INTO ML_Ends (NumMl,Okonchanie,Styk,Status_Styka,Line_Priv,Adres,Dop) values (@NumMl,@Okonchanie,@Styk,@Status_Styka,@Line_Priv,@Adres,@Dop)
END
