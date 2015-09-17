CREATE TABLE [dbo].[SZ_Spisok_Prichin] (
    [Pr]      NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__SZ_Spisok__rowgu__60FC61CA] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1861581670]
    ON [dbo].[SZ_Spisok_Prichin]([rowguid] ASC);

