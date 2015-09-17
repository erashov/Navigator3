CREATE TABLE [dbo].[Список стыков] (
    [Styk]    NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Список ст__rowgu__10E07F16] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_110623437]
    ON [dbo].[Список стыков]([rowguid] ASC);

