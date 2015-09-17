CREATE PROCEDURE dbo.ML_Main_INSERT_New @NumML int,
                                    @Nom_Kan nvarchar(50),
                                    @Usluga nvarchar(255),
                                    @Pre_Usluga nvarchar(50),
                                    @Zakazchik nvarchar(255),
                                    @Manager nvarchar(30),
                                    @Telefon nvarchar(11),
                                    @Osnovanie nvarchar(255),
                                    @Kontakt_Ob nvarchar(255),
                                    @Skorost nvarchar(15),
                                    @Klient nvarchar(15),
                                    @Srochnost nvarchar(21)
 
AS

set nocount on 
INSERT INTO dbo.ML_Main
([NumML],[Nom_Kan],[Usluga],[Pre_Usluga],[Zakazchik],[Manager],[Telefon],[Osnovanie],[Kontakt_Ob],[Skorost],[Klient],[Srochnost]) VALUES (@NumML,@Nom_Kan,@Usluga,@Pre_Usluga,@Zakazchik,@Manager,@Telefon,@Osnovanie,@Kontakt_Ob,@Skorost,@Klient,@Srochnost)