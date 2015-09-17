CREATE TABLE [dbo].[Sp_status] (
    [aaa]     NVARCHAR (4)     NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Sp_status__rowgu__0EC32C7A] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_626101271]
    ON [dbo].[Sp_status]([rowguid] ASC);

