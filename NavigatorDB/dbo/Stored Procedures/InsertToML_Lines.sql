-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertToML_Lines (@NumMl int,@Line_type varchar(25),@TransitNode varchar(255),@BindingSite varchar(255),@Markirovka varchar(100),@Uzlovaya_stanc varchar(255))
AS
BEGIN
INSERT INTO ML_Lines(NumMl,Line_type,TransitNode,BindingSite,Markirovka,Uzlovaya_stanc) values (@NumMl,@Line_type,@TransitNode,@BindingSite,@Markirovka,@Uzlovaya_stanc)
END
