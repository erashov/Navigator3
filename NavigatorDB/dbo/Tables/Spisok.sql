CREATE TABLE [dbo].[Spisok] (
    [town]     NVARCHAR (50)    NULL,
    [Street]   NVARCHAR (255)   NULL,
    [rowguid]  UNIQUEIDENTIFIER NOT NULL,
    [rowguid4] UNIQUEIDENTIFIER CONSTRAINT [DF__Spisok__rowguid4__06A2E7C5] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_95339404]
    ON [dbo].[Spisok]([rowguid4] ASC);

