CREATE PROCEDURE dbo.ML_MSO_Main @NumML int
AS

set nocount on 


SELECT NumML, Nom_Kan, EqNum, Usluga, Pre_Usluga, Zakazchik, Manager, Telefon, Osnovanie, Kontakt_Ob, Skorost, Klient, Srochnost, Data_utv, Otvetstv_ULSS, Data_ULSS, Kabel_prov, IP_Adres1, IP_Adres2, Maska1, Maska2, SignalFormat,NumberRetrans,Data_Otkl, PortMMTSNum
FROM dbo.ML_Main
WHERE NumML = @NumML