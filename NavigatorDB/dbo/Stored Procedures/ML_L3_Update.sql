﻿CREATE PROCEDURE dbo.ML_L3_Update @NumML int,    
                                   @Nom_Kan nvarchar(50),
                                   @EqNum   nvarchar(50),
                                   @Usluga  nvarchar(255),
                                   @Pre_Usluga nvarchar(50),
                                   @Zakazchik nvarchar(255),
                                   @Manager   nvarchar(30),
                                   @Telefon nvarchar(11),
                                   @Osnovanie nvarchar(255),
                                   @Kontakt_Ob nvarchar(255),
                                   @Kol_vo_kan nvarchar(50),
                                   @Skorost nvarchar(15),
                                   @QoS nvarchar(25),
                                   @Klient nvarchar(15),
                                   @Srochnost nvarchar(21) ,
                                   @Otvetstv_ULSS nvarchar(100),
                                   @Data_ULSS nvarchar(50),
                                   @Kabel_prov    nvarchar(255),
                                   @Data_otkl nvarchar(100), 
                                   @IP_Adres1 nvarchar(100), 
                                   @IP_Adres2 nvarchar(100), 
                                   @Maska1 nvarchar(100), 
                                   @Maska2 nvarchar(100)

AS

set nocount on 

Update dbo.ML_Main
Set Nom_Kan = @Nom_Kan,
    EqNum = @EqNum,
    Usluga = @Usluga,
    Pre_Usluga = @Pre_Usluga,
    Zakazchik = @Zakazchik,
    Manager = @Manager,
    Telefon = @Telefon,
    Osnovanie = @Osnovanie,
    Kontakt_Ob = @Kontakt_Ob,
    Kol_vo_kan = @Kol_vo_kan,
    Skorost = @Skorost,
    QoS = @QoS,
    Klient = @Klient,
    Srochnost = @Srochnost,
    Otvetstv_ULSS = @Otvetstv_ULSS,
    Data_ULSS = @Data_ULSS,
    Kabel_prov = @Kabel_prov,
    Data_otkl =  @Data_otkl, 
    IP_Adres1 = @IP_Adres1,
    IP_Adres2 = @IP_Adres2,
    Maska1 = @Maska1,
    Maska2 = @Maska2
WHERE NumML = @NumML