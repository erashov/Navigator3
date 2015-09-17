CREATE TABLE [dbo].[Folomkin_Data] (
    [NumML]   INT              CONSTRAINT [DF__Folomkin___NumML__2C3393D0] DEFAULT (0) NOT NULL,
    [D_PrivA] DATETIME         NULL,
    [D_PrivB] DATETIME         NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Folomkin___rowgu__4B973090] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaaFolomkin_Data_PK] PRIMARY KEY NONCLUSTERED ([NumML] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [List2NavFolomkin_Data]
    ON [dbo].[Folomkin_Data]([NumML] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_725577623]
    ON [dbo].[Folomkin_Data]([rowguid] ASC);

