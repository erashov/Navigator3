CREATE TABLE [dbo].[Logikal] (
    [Log]     NVARCHAR (21)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Logikal__rowguid__5EDF0F2E] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1349579846]
    ON [dbo].[Logikal]([rowguid] ASC);

