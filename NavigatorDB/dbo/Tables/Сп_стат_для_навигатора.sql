CREATE TABLE [dbo].[Сп_стат_для_навигатора] (
    [Status_klienta] NVARCHAR (50)    NULL,
    [rowguid]        UNIQUEIDENTIFIER CONSTRAINT [DF__Сп_стат_д__rowgu__4A18FC72] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1602104748]
    ON [dbo].[Сп_стат_для_навигатора]([rowguid] ASC);

