CREATE TABLE [dbo].[Logikal1] (
    [Log]     NVARCHAR (21)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Logikal1__rowgui__592635D8] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1397580017]
    ON [dbo].[Logikal1]([rowguid] ASC);

