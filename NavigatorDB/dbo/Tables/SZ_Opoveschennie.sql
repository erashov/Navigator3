CREATE TABLE [dbo].[SZ_Opoveschennie] (
    [kod]     INT              CONSTRAINT [DF__SZ_Opovesch__kod__6C190EBB] DEFAULT (0) NULL,
    [FIO]     NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__SZ_Opoves__rowgu__66B53B20] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [PK_SZ_Opoveschennie] PRIMARY KEY CLUSTERED ([rowguid] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1797581442]
    ON [dbo].[SZ_Opoveschennie]([rowguid] ASC);

