CREATE TABLE [dbo].[ots] (
    [numl]    INT              CONSTRAINT [DF__ots__numl__123EB7A3] DEFAULT (0) NOT NULL,
    [text]    NVARCHAR (255)   NULL,
    [fio]     NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__ots__rowguid__2942188C] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaaots_PK] PRIMARY KEY NONCLUSTERED ([numl] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [List2Navots]
    ON [dbo].[ots]([numl] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_290100074]
    ON [dbo].[ots]([rowguid] ASC);

