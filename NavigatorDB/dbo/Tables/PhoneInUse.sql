CREATE TABLE [dbo].[PhoneInUse] (
    [PhoneId]  INT            NOT NULL,
    [OwnerId]  INT            NOT NULL,
    [DateB]    DATETIME       NULL,
    [comments] NVARCHAR (256) NULL,
    CONSTRAINT [PK_PhoneInUse] PRIMARY KEY NONCLUSTERED ([PhoneId] ASC, [OwnerId] ASC)
);


GO

CREATE TRIGGER [dbo].[PhoneInUse_DATE_FORMAT]
   ON  [dbo].[PhoneInUse]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT dmy;
	INSERT INTO PhoneInUse(PhoneId, OwnerId, DateB)
	select PhoneId, OwnerId, getdate() from inserted;
END

--select convert(datetime, '25.05.2010', 104)
--select convert(datetime, null, 104)
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[PhoneInUse_DATE_FORMAT]
   ON  [dbo].[PhoneInUse]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO PhoneInUse(PhoneId, OwnerId, DateB)
	select PhoneId, OwnerId, CONVERT(DATETIME, DateB, 104) from inserted;
END
*/