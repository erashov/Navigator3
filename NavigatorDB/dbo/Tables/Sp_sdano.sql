CREATE TABLE [dbo].[Sp_sdano] (
    [sp]      NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Sp_sdano__rowgui__147C05D0] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_674101442]
    ON [dbo].[Sp_sdano]([rowguid] ASC);

