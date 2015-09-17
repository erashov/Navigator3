CREATE TABLE [dbo].[Монтаж] (
    [Монтаж]  NVARCHAR (60)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Монтаж__rowguid__4FD1D5C8] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1669580986]
    ON [dbo].[Монтаж]([rowguid] ASC);

