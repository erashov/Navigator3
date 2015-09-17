CREATE PROCEDURE [dbo].[report_UIIAS_Performed_I]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as    
    select List2Nav.NumML as "Номер МЛ",                    
	    D_UIIAS as "Дата выдачи задания по А",
        D_UIIAS_sost as "Дата выдачи задания по B",
        D_USHTU as "Дата выдачи задания по УШТУ по А",
        D_USHTU_Sost as "Дата выдачи задания по УШТУ по B", 
		List2Nav.Utverzh as "Дата утверждения",
		List2Nav.Sdan_TS as "Дата сдачи ТС",
		List2Nav.Sdan as "Дата сдачи",
        List2Nav.Prim as "Примечание",										   
		Usluga as "Услуга"                  
    from List2Nav
    where 
	    List2Nav.Sdan_TS >= CONVERT(DATETIME, @start_date, 104)
	    and List2Nav.Sdan_TS < DATEADD(mi,1439,CONVERT(DATETIME, @end_date, 104))
        and ((Usluga Like '%i%') and (D_UIIAS_sost is not null))
        AND List2Nav.ProblML Is Null
	    and List2Nav.numML < 1000000