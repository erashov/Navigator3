CREATE TABLE [dbo].[Metka] (
    [Metka]   NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Metka__rowguid__4DB4832C] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1445580188]
    ON [dbo].[Metka]([rowguid] ASC);

