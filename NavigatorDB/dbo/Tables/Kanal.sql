CREATE TABLE [dbo].[Kanal] (
    [Kanal]   NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Kanal__rowguid__6A50C1DA] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1029578706]
    ON [dbo].[Kanal]([rowguid] ASC);

