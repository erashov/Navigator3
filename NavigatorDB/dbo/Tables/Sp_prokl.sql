CREATE TABLE [dbo].[Sp_prokl] (
    [sp]      NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Sp_prokl__rowgui__1A34DF26] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_722101613]
    ON [dbo].[Sp_prokl]([rowguid] ASC);

