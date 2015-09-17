CREATE TABLE [dbo].[Pon] (
    [pon]     NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Pon__rowguid__3C89F72A] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1621580815]
    ON [dbo].[Pon]([rowguid] ASC);

