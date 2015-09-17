CREATE TABLE [dbo].[sp_f_d_USHKm] (
    [sp]      NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__sp_f_d_US__rowgu__36D11DD4] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_914102297]
    ON [dbo].[sp_f_d_USHKm]([rowguid] ASC);

