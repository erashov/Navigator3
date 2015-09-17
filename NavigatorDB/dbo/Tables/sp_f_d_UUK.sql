CREATE TABLE [dbo].[sp_f_d_UUK] (
    [sp]      NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__sp_f_d_UU__rowgu__3118447E] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_866102126]
    ON [dbo].[sp_f_d_UUK]([rowguid] ASC);

