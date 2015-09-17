CREATE PROCEDURE dbo.ML_L2_Main @NumML int
AS

set nocount on 


SELECT NumML, Nom_Kan, EqNum, Usluga, Pre_Usluga, Zakazchik, Manager, Telefon, Osnovanie, Kontakt_Ob, Skorost, Klient,Kol_vo_kan, QoS, Srochnost, Data_utv, Otvetstv_ULSS, Data_ULSS, Kabel_prov, Data_Otkl, PortMMTSNum  
FROM dbo.ML_Main
WHERE NumML = @NumML