CREATE PROCEDURE [dbo].[RefuseML] as

update osnova 
set utverzh_b=NULL where osnova.signI2 is not null /*and osnova.signI2!=2 and osnova.signI2!=3*/ and utverzh_b is not NULL
