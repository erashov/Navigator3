
CREATE PROCEDURE [dbo].[report_ML_81]
    @start_date nvarchar(25),
	@end_date  nvarchar(25)

as
-- Отчёт по МЛ ДЭЛС (УСП), находящимся в работе и утверждённые до даты 

select 
	 ln.numml ML,
     ln.zakazhcik "заказчик",
     ln.otvetstv "ответственный",
	 ln.AdresA "Адрес А",
     ln.AdresB "Адрес B",
    REPLACE(REPLACE(ISNULL(' ' + ln.E, '') + ISNULL(' ' + ln.S, '') + ISNULL(' ' + ln.V, '')  
    						   + ISNULL(' ' + ln.T, '') + ISNULL(' ' + ln.P, '') + ISNULL(' ' + ln.I, '') + ISNULL(' ' + ln.R, '')  
    						   + ISNULL(' ' + ln.Q, '') + ISNULL(' ' + ln.SpecOb, ''), ',', ' '), ';', ' ')  
    						  AS "Услуги",
     isnull(ln.c,ln.b) "задан.ОП",
	 ln.Usluga "Тип",
     case when (ln.res1_d=1)then 'Зап'
     else case when (ln.res1_d=2)then 'Вос'
          else case when (ln.res1_d=3)then 'Сев'
          else case when (ln.res1_d=4)then 'Юг'
               else case when (ln.res1_d=5)then 'Центр'
                    else '' end  end  end  end  end as "гр.",
     --ln.sdan_ts,
     --ln.c, ln.D_USP,
     --ln.b, ln.D_USP1,
     ht.starttime "дата_заморозки",
     ht.username "сотрудник",
     ht.Comment "причина",
     ln.Sroch_SZ "срочность"
     --ln.signC3 

   from
    List2Nav ln left join 
                    (
						select distinct
						t1.numml, 
				        t1.starttime,
						t1.username,
						t1.Comment
						from
						(
						select
						numml, 
						starttime,
						username,
						Comment,
				        max(starttime)over(partition by numml) maxStartTime      
						from ML_History
						where  Step=8 and EndTime is null
						)t1
						where t1.starttime = t1.maxStartTime                         
					)ht

on ln.numml=ht.NumML
   where      
(((ln.NumML)<1000000) 
AND ((ln.Usluga) Not Like '%v%' 
And (ln.Usluga) Not Like '%l%' 
And (ln.Usluga) Not Like '%k%' 
And (ln.Usluga) Not Like '%SR%') 
AND ((ln.ProblML) Is Null))

and ((NRUSP=1 and D_USP is null) or (NRUSP1=1 and D_USP1 is null))

--and ht.starttime is not null

--and ln.Utverzh <= DATEADD(hh,18,CONVERT(DATETIME, @end_date, 104))
 
order by ln.numml desc
