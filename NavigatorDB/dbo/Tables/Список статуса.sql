CREATE TABLE [dbo].[Список статуса] (
    [Status_klienta] NVARCHAR (50)    NULL,
    [rowguid]        UNIQUEIDENTIFIER CONSTRAINT [DF__Список ст__rowgu__220B0B18] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_2114106572]
    ON [dbo].[Список статуса]([rowguid] ASC);

