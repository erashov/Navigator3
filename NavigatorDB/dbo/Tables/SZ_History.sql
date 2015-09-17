CREATE TABLE [dbo].[SZ_History] (
    [kod]     INT              IDENTITY (1, 1) NOT NULL,
    [NumML]   INT              CONSTRAINT [DF__SZ_Histor__NumML__6754599E] DEFAULT (0) NULL,
    [NomSZ]   NVARCHAR (50)    NULL,
    [Data_SZ] DATETIME         NULL,
    [Text]    NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__SZ_Histor__rowgu__6C6E1476] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaaSZ_History_PK] PRIMARY KEY NONCLUSTERED ([kod] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1717581157]
    ON [dbo].[SZ_History]([rowguid] ASC);

