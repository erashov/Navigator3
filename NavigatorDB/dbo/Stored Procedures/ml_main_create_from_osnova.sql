create procedure dbo.ml_main_create_from_osnova
as
begin
	insert into ml_main (numml, Nom_Kan, EqNum, Usluga, Pre_usluga, Zakazchik, Manager, Telefon, Osnovanie, Kontakt_Ob, Kol_vo_kan, Skorost, QoS, Klient, Srochnost, data_utv)
	select numml, Nom_Kan, null, Usluga, Pre_usluga, Zakazchik, Manager, Telefon, Osnovanie, Kontakt_Ob, Kol_vo_kan, Skorost, QoS, Klient, Srochnost, utverzh_b
	from Osnova
	where numml = 290162
end;