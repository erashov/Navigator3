CREATE TABLE [dbo].[uzly] (
    [organ]   NVARCHAR (250)   NULL,
    [adres]   NVARCHAR (250)   NULL,
    [sokr]    NVARCHAR (250)   NULL,
    [Код]     INT              IDENTITY (1, 1) NOT NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__uzly__rowguid__558AAF1E] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaauzly_PK] PRIMARY KEY NONCLUSTERED ([Код] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_2025058250]
    ON [dbo].[uzly]([rowguid] ASC);

