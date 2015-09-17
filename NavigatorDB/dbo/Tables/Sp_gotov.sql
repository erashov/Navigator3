CREATE TABLE [dbo].[Sp_gotov] (
    [sp]      NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Sp_gotov__rowgui__1FEDB87C] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_770101784]
    ON [dbo].[Sp_gotov]([rowguid] ASC);

