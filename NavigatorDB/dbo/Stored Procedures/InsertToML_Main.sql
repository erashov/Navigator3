-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertToML_Main (@NumMl int,@Usluga varchar(255),@Pre_Usluga varchar(50),@Zakazchik varchar(255),@Manager varchar(30),@Telefon varchar(11),@Skorost varchar(15),@Data_utv varchar(50),@Nom_Kan varchar(50))
AS
BEGIN
INSERT INTO ML_Main(NumMl,Usluga,Pre_Usluga,Zakazchik,Manager,Telefon,Skorost,Data_utv,Nom_Kan) values (@NumMl,@Usluga,@Pre_Usluga,@Zakazchik,@Manager,@Telefon,@Skorost,@Data_utv,@Nom_Kan)
END
