CREATE TABLE [dbo].[Элементы кнопочной формы] (
    [SwitchboardID] INT              CONSTRAINT [DF__Элементы __Switc__756D6ECB] DEFAULT (0) NOT NULL,
    [ItemNumber]    SMALLINT         CONSTRAINT [DF__Элементы __ItemN__76619304] DEFAULT (0) NOT NULL,
    [ItemText]      NVARCHAR (255)   NULL,
    [Command]       SMALLINT         CONSTRAINT [DF__Элементы __Comma__7755B73D] DEFAULT (0) NULL,
    [Argument]      NVARCHAR (50)    NULL,
    [rowguid]       UNIQUEIDENTIFIER CONSTRAINT [DF__Элементы __rowgu__056ECC6A] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaaЭлементы кнопочной формы_PK] PRIMARY KEY NONCLUSTERED ([SwitchboardID] ASC, [ItemNumber] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1954106002]
    ON [dbo].[Элементы кнопочной формы]([rowguid] ASC);

