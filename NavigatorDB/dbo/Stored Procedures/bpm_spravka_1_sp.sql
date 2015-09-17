
create procedure dbo.bpm_spravka_1_sp
as
	/* Услуги, которые оказывает компания */
	SELECT 
		distinct Usluga as 'Услуга' 
	FROM 
		Osnova
	where
		Usluga Is NOT NULL
		and Usluga <> 'test'
		and Usluga <> ''