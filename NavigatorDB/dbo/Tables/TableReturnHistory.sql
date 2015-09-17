CREATE TABLE [dbo].[TableReturnHistory] (
    [id]            UNIQUEIDENTIFIER CONSTRAINT [DF_TableReturnHistory_id] DEFAULT (newid()) NOT NULL,
    [number]        INT              IDENTITY (1, 1) NOT NULL,
    [numberML]      INT              NOT NULL,
    [returnType]    INT              NOT NULL,
    [returnText]    VARCHAR (100)    NOT NULL,
    [returnDate]    DATETIME         CONSTRAINT [DF_TableReturnHistory_returnDate] DEFAULT (getdate()) NOT NULL,
    [returnUser]    VARCHAR (100)    CONSTRAINT [DF_TableReturnHistory_returnUser] DEFAULT (suser_sname()) NOT NULL,
    [enableReturn]  INT              CONSTRAINT [DF_TableReturnHistory_enableReturn] DEFAULT ((1)) NULL,
    [dateConfirmML] DATETIME         NULL,
    [MLinWork]      BIT              CONSTRAINT [DF_TableReturnHistory_MLinWork] DEFAULT ((0)) NULL,
    [returnSign]    INT              NULL,
    CONSTRAINT [PK_TableReturnHistory] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [Index_numberML]
    ON [dbo].[TableReturnHistory]([numberML] ASC)
    INCLUDE([returnDate], [dateConfirmML]);


GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [OnDeleteTableReturnHistory] 
   ON  [dbo].[TableReturnHistory] 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @NumberTRH int;
	DECLARE @NumberMLTRH int;
	DECLARE @returnTextTRH varchar(100);
	select @NumberTRH = number,@NumberMLTRH = numberML,@returnTextTRH = returnText
	from deleted;

    insert into LogTableReturnHistory(numberML,numberTableReturnHistory,returnText,sqlCommandType) 
		values(@NumberMLTRH,@NumberTRH,@returnTextTRH,'delete');

END



GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [OnInsertTableReturnHistory] 
   ON  [dbo].[TableReturnHistory] 
   AFTER INSERT	
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @NumberTRH int;
	DECLARE @NumberMLTRH int;
	DECLARE @returnTextTRH varchar(100);
	select @NumberTRH = number,@NumberMLTRH = numberML,@returnTextTRH = returnText
	from inserted;

    insert into LogTableReturnHistory(numberML,numberTableReturnHistory,returnText,sqlCommandType) 
		values(@NumberMLTRH,@NumberTRH,@returnTextTRH,'inserted');

END



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TableReturnHistory', @level2type = N'COLUMN', @level2name = N'returnDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Дата когда возвращаемый МЛ был утверждён', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TableReturnHistory', @level2type = N'COLUMN', @level2name = N'dateConfirmML';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'признак с какого этапа был возвращён МЛ: До обработки АИДУ или после', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TableReturnHistory', @level2type = N'COLUMN', @level2name = N'MLinWork';

