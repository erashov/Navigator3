CREATE TABLE [dbo].[LockedEntities] (
    [EntityName] NVARCHAR (255) NOT NULL,
    [UserName]   NVARCHAR (255) NULL,
    [LockDate]   DATETIME       NULL,
    [UnlockDate] DATETIME       NULL,
    CONSTRAINT [PK_LockedEntities] PRIMARY KEY CLUSTERED ([EntityName] ASC)
);

