CREATE TABLE [dbo].[Sp_for_d_otkl] (
    [for_d_otkl] NVARCHAR (50)    NULL,
    [rowguid]    UNIQUEIDENTIFIER CONSTRAINT [DF__Sp_for_d___rowgu__25A691D2] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_818101955]
    ON [dbo].[Sp_for_d_otkl]([rowguid] ASC);

