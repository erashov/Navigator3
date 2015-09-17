CREATE PROCEDURE dbo.ML_T_Main @NumML int
AS

set nocount on 


SELECT NumML, Nom_Kan, EqNum, Usluga, Pre_Usluga, Zakazchik, Manager, Telefon, Osnovanie, Kontakt_Ob, Kol_vo_kan, Skorost, QoS, Klient, Srochnost, Data_utv, Otvetstv_ULSS, Data_ULSS, Kabel_prov, IP_Adres1, Maska1, Shluz,DNS, Data_Otkl,PortMMTSNum, Chanal_Type
FROM dbo.ML_Main
WHERE NumML = @NumML