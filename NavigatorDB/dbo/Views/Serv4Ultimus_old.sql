CREATE VIEW [dbo].[Serv4Ultimus_old]
AS
SELECT     dbo.List2Nav.NumML, CASE ISNULL(I, '') WHEN '' THEN '' ELSE I + ' ' END + CASE ISNULL(E, '') WHEN '' THEN '' ELSE E + ' ' END + CASE ISNULL(S, 
                      '') WHEN '' THEN '' ELSE S + ' ' END + CASE ISNULL(T, '') WHEN '' THEN '' ELSE T + ' ' END + CASE ISNULL(P, '') 
                      WHEN '' THEN '' ELSE P + ' ' END + CASE ISNULL(V, '') WHEN '' THEN '' ELSE V + ' ' END + CASE ISNULL(R, '') 
                      WHEN '' THEN '' ELSE R + ' ' END + CASE ISNULL(Q, '') WHEN '' THEN '' ELSE Q + ' ' END + CASE ISNULL(SpecOb, '') 
                      WHEN '' THEN '' ELSE SpecOb + ' ' END + CASE ISNULL(NDogov, '') WHEN '' THEN '' ELSE NDogov + ' ' END + CASE ISNULL(NTelef, '') 
                      WHEN '' THEN '' ELSE NTelef + ' ' END AS serv, dbo.List2Nav.Zakazhcik AS Client, dbo.Osnova.Usluga, dbo.List2Nav.AdresA as Adres_A, dbo.List2Nav.AdresB as Adres_B, 
                      dbo.Osnova.Kontakt_A, dbo.Osnova.Kontakt_B, dbo.Osnova.Osnovanie AS Dogovor,
                      dbo.List2Nav.Usluga AS Type, (ISNULL(dbo.List2Nav.AdresA,'') + char(13) + ISNULL(dbo.List2Nav.AdresB,'')) AS Addresses,
                      dbo.List2Nav.Sdan, dbo.List2Nav.Probl, dbo.List2Nav.Prim
FROM         dbo.List2Nav LEFT OUTER JOIN
                      dbo.Osnova ON dbo.List2Nav.NumML = dbo.Osnova.NumML
