CREATE TABLE [dbo].[Table_Put] (
    [put]     NVARCHAR (255)   NOT NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Table_Put__rowgu__5B438874] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaaTable_Put_PK] PRIMARY KEY NONCLUSTERED ([put] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_5575058]
    ON [dbo].[Table_Put]([rowguid] ASC);

