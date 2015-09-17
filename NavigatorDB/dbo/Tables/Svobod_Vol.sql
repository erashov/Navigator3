CREATE TABLE [dbo].[Svobod_Vol] (
    [NumML]   INT              CONSTRAINT [DF__Svobod_Vo__NumML__7D78A4E7] DEFAULT (0) NULL,
    [Text]    NTEXT            NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Svobod_Vo__rowgu__7226EDCC] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_2089058478]
    ON [dbo].[Svobod_Vol]([rowguid] ASC);

