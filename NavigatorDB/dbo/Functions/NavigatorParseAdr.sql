/*
	Функция получения номеров строения и корпуса из поля Num таблицы TheAddr
Вход:
	@Num - поле дома вместе с корпусом и стронием
	@what:
		дом - номер дома
		стр - на выходе номер строения
		кор - на выходе номер корпуса
		этж - на выходе номер этажа
Note: не особо оптимально и элегантно, зато железобетонно
*/
CREATE FUNCTION dbo.NavigatorParseAdr (@Num varchar(120), @what char(3))  
	RETURNS nvarchar(120) AS  
BEGIN 

IF (@Num IS NULL) OR (@Num = '') 
	RETURN NULL

DECLARE @C int
DECLARE @pat varchar(32)

IF (@what = 'стр')
BEGIN -- попробуем вытащить номер строения
SET @C = PATINDEX('%стр. %',@Num)
IF (@C > 0)
	SET @C = @C+5
ELSE
BEGIN
	SET @C = PATINDEX('%стр.%',@Num)
	IF (@C <= 0)
		SET @C = PATINDEX('%стр %',@Num)
	IF (@C > 0)
		SET @C = @C+4
	ELSE
	BEGIN
		SET @C = PATINDEX('%стр%',@Num)
	  	IF (@C > 0)
	    		SET @C = @C+3
	  	ELSE
	  	BEGIN
	    		SET @C = CHARINDEX('С',@Num) -- Русское C
	   		IF (@C = 0) 
	      			SET @C = CHARINDEX('C',@Num) -- Латинское C
	    		IF (@C = 0) 
	      			SET @C = CHARINDEX('с',@Num) -- Русское c
	    		IF (@C = 0) 
	      			SET @C = CHARINDEX('c',@Num) -- Латинское c
	    		IF (@C > 0) 
	      			SET @C = @C+1
	  	END
	END
END
SET @pat = '%[^0-9]%'
END
ELSE
IF (@what = 'кор')
BEGIN -- попробуем вытащить номер корпуса
    SET @C = PATINDEX('%корп. %',@Num)
    IF (@C > 0)
	SET @C = @C+6
    ELSE
    BEGIN
	SET @C = PATINDEX('%корп.%',@Num)
	IF (@C <= 0)
		SET @C = PATINDEX('%корп %',@Num)
	IF (@C <= 0)
		SET @C = PATINDEX('%кор. %',@Num)
	IF (@C > 0)
		SET @C = @C+5
	ELSE
	BEGIN
		SET @C = PATINDEX('%корп%',@Num)
	  	IF (@C > 0)
	    		SET @C = @C+4
	  	ELSE
	  	BEGIN
	    		SET @C = PATINDEX('%кор.%',@Num)
			IF (@C <= 0)
				SET @C = PATINDEX('%кор %',@Num)
	    		IF (@C > 0)
	      			SET @C = @C+4
                 		ELSE
	    		BEGIN
	      			SET @C = PATINDEX('%кор%',@Num)
	      			IF (@C > 0)
	        				SET @C = @C+3
                   			ELSE
  	      			BEGIN
    	        				SET @C = CHARINDEX('К',@Num) -- Русское К
	        				IF (@C = 0) 
	         					SET @C = CHARINDEX('K',@Num) -- Латинское K
	        				IF (@C = 0) 
	          					SET @C = CHARINDEX('к',@Num) -- Русское к
	        				IF (@C = 0) 
	          					SET @C = CHARINDEX('k',@Num) -- Латинское k
	        				IF (@C > 0) 
	          					SET @C = @C+1
	      			END
	    		END
                	END
              END
    END
SET @pat = '%[^0-9]%'
END
ELSE
IF (@what = 'этж')
BEGIN -- попробуем вытащить номер этажа
	SET @C = PATINDEX('%этаж %',@Num)
	IF (@C > 0)
		SET @C = @C+5
	ELSE
	BEGIN
		SET @C = PATINDEX('%этаж%',@Num)
	  	IF (@C > 0)
	    		SET @C = @C+4
	  	ELSE
	  	BEGIN
	    		SET @C = PATINDEX('%эт. %',@Num)
	    		IF (@C > 0)
	      			SET @C = @C+4
                 		ELSE
	    		BEGIN
	      			SET @C = PATINDEX('%эт.%',@Num)
				IF (@C <= 0)
					SET @C = PATINDEX('%эт %',@Num)
	      			IF (@C > 0)
	        				SET @C = @C+3
	    		END
                	END
              END
	SET @pat = '%[^0-9]%'
END
ELSE
IF (@what = 'ком')
BEGIN -- попробуем вытащить номер корпуса
    SET @C = PATINDEX('%комн. %',@Num)
    IF (@C > 0)
	SET @C = @C+6
    ELSE
    BEGIN
	SET @C = PATINDEX('%комн.%',@Num)
	IF (@C <= 0)
		SET @C = PATINDEX('%комн %',@Num)
	IF (@C <= 0)
		SET @C = PATINDEX('%ком. %',@Num)
	IF (@C > 0)
		SET @C = @C+5
	ELSE
	BEGIN
		SET @C = PATINDEX('%комн%',@Num)
	  	IF (@C > 0)
	    		SET @C = @C+4
	  	ELSE
	  	BEGIN
	    		SET @C = PATINDEX('%ком.%',@Num)
			IF (@C <= 0)
				SET @C = PATINDEX('%ком %',@Num)
	    		IF (@C > 0)
	      			SET @C = @C+4
                 		ELSE
	    		BEGIN
	      			SET @C = PATINDEX('%ком%',@Num)
	      			IF (@C > 0)
	        				SET @C = @C+3
	    		END
                	END
              END
    END
    SET @pat = '%[^0-9]%'
END
ELSE
IF (@what = 'дом')
BEGIN
	IF (PATINDEX('[0-9]%', @Num) <> 1) -- Если начинается не с цифры, то это неправильный дом
		RETURN NULL
	SET @C = 1
	SET @pat = '%[ЭэCcСсKkКк., ]%'
END
ELSE
RETURN NULL

IF (@C <= 0) 
	RETURN NULL

DECLARE @to int
SET @to = PATINDEX(@pat, SUBSTRING(@Num,@C,LEN(@Num)))-1

RETURN NULLIF(CAST(SUBSTRING(@Num, @C, CASE WHEN @to<0 THEN LEN(@Num) ELSE @to END) AS nvarchar(120)),'')
END










