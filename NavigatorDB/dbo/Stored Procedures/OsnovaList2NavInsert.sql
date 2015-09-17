Create procedure dbo.OsnovaList2NavInsert
AS

set nocount on 

SELECT DISTINCT Osnova.NumML, Osnova.Pre_Usluga, Osnova.Usluga, Osnova.Nom_Kan, Osnova.Zakazchik, Osnova.Manager, Osnova.Telefon, Osnova.Osnovanie, Osnova.Kontakt_Ob, Osnova.Skorost, Osnova.Kol_vo_kan, Osnova.Klient, Osnova.Srochnost, Osnova.Styk_A, Osnova.Styk_A1, Osnova.Status_StykA, Osnova.Line_PrivA, Osnova.Kontakt_A, Osnova.Dop_A, Osnova.Styk_B, Osnova.Styk_B1, Osnova.Status_StykB, Osnova.Line_PrivB, Osnova.Kontakt_B, Osnova.Dop_B, Osnova.Utverzh_M, Osnova.Utverzh_B, Osnova.Kodir_Usl, Osnova.town1, Osnova.Street1, Osnova.Dom1, Osnova.Str1, Osnova.Kor1, Osnova.flow1, Osnova.romm1, Osnova.town2, Osnova.Street2, Osnova.Dom2, Osnova.Str2, Osnova.Kor2, Osnova.flow2, Osnova.romm2, Osnova.signC1, Osnova.signI3, Osnova.signI2, Osnova.signC2, Osnova.QoS, Osnova.ParamStyk1, Osnova.ParamStyk2, Osnova.SpecProject, Osnova.signD2, Osnova.signC3
FROM Osnova LEFT JOIN List2Nav ON Osnova.NumML = List2Nav.NumML
WHERE (Osnova.NumML>42000 AND ((Osnova.Utverzh_B) Is Not Null)  AND ((Osnova.signI2)=0 Or (Osnova.signI2) Is Null) AND ((List2Nav.NumML) Is Null))
ORDER BY Osnova.NumML DESC;
