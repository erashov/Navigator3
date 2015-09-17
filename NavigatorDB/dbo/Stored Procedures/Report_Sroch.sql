CREATE PROCEDURE dbo.Report_Sroch
 
AS

set nocount on 
Select l.Numml,o.Utverzh_B, l.Sroch_SZ, l.SZ_Date, o.Manager, o.Zakazchik, o.Usluga, l.Usluga as kodirovka, l.AdresA, l.AdresB, l.Data_Sost_A,l.Data_Sost_B,l.taskFOConnection, l.b, l.c, l.D_USP, l.D_USP1, l.Probl, l.G_A, l.G_B, l.TaskFOConnection, l.Data_Sost_A, l.Data_Sost_B, l.IDO, l.PrivA, l.PrivB, l.utverzh, l.NRUSP, l.NRUSP1, l.D_USP,l.D_USP1, l.c, l.b, l.DUP, l.signB1
From list2nav l inner join osnova o
on l.NumML = o.NumML
where Sdan_TS is Null and l.problMl is null and l.Sroch_SZ is not null