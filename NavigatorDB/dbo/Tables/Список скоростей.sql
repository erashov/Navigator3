CREATE TABLE [dbo].[Список скоростей] (
    [Skorost] NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Список ск__rowgu__2D7CBDC4] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1378103950]
    ON [dbo].[Список скоростей]([rowguid] ASC);

