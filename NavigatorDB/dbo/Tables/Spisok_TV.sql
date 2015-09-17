CREATE TABLE [dbo].[Spisok_TV] (
    [spisok]  NVARCHAR (250)   NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Spisok_TV__rowgu__77DFC722] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_69575286]
    ON [dbo].[Spisok_TV]([rowguid] ASC);

