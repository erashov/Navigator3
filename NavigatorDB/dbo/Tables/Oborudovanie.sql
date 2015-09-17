CREATE TABLE [dbo].[Oborudovanie] (
    [NumML]   INT              CONSTRAINT [DF__Oborudova__NumML__59FA5E80] DEFAULT (0) NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Oborudova__rowgu__2EFAF1E2] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1493580359]
    ON [dbo].[Oborudovanie]([rowguid] ASC);

