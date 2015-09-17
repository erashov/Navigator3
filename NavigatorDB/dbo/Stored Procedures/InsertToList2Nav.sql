-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertToList2Nav (@NumML int,@Zakazhcik  varchar(255),@AdresA varchar(255),@AdresB varchar(255),@Otvetstv varchar(50),@Styk_A varchar(32),@Styk_B varchar(32),@Dop_A varchar(512),@Dop_B varchar(512),@P varchar(50),@SpecOb varchar(50))
AS
BEGIN
INSERT INTO List2Nav (NumML,Zakazhcik,AdresA,AdresB,Otvetstv,Styk_A,Styk_B,Dop_A,Dop_B,P,SpecOb) values(@NumML,@Zakazhcik,@AdresA,@AdresB,@Otvetstv,@Styk_A,@Styk_B,@Dop_A,@Dop_B,@P,@SpecOb)
END
