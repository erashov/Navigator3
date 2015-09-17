CREATE TABLE [dbo].[Wfl_RouteSheetFreezings] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [RSNumber]             INT            NOT NULL,
    [StartDate]            DATETIME       NOT NULL,
    [StopDate]             DATETIME       NULL,
    [FreezeDepartmentId]   INT            NULL,
    [UnfreezeDepartmentId] INT            NULL,
    [FreezeReason]         INT            NULL,
    [Comment]              NVARCHAR (MAX) NULL,
    [FreezeUser]           NVARCHAR (50)  NULL,
    [UnfreezeUser]         NVARCHAR (50)  NULL,
    [TaskId]               INT            NULL,
    [CommentUnfreezing]    NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_WFL_ROUTESHEETFREEZINGS] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FreezingDepartmentForRSFreezing] FOREIGN KEY ([FreezeDepartmentId]) REFERENCES [dbo].[Wfl_Depts] ([Id]) ON UPDATE CASCADE,
    CONSTRAINT [FK_UnfreezingDepartmentForRSFreezing] FOREIGN KEY ([UnfreezeDepartmentId]) REFERENCES [dbo].[Wfl_Depts] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'История заморозок МЛ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Номер МЛ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'RSNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Дата начала заморозки', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'StartDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Дата окончания заморозки', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'StopDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Подразделение, заморозившее МЛ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'FreezeDepartmentId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Подразделение, снявшее заморозку', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'UnfreezeDepartmentId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Основание заморозки', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'FreezeReason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Примечание', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'Comment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Пользователь, наложивший заморозку', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'FreezeUser';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Пользователь, снявший заморозку', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'UnfreezeUser';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Id задачи, по которой был заморожен МЛ. Указывается только если МЛ был заморожен вследствие назначения задания.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_RouteSheetFreezings', @level2type = N'COLUMN', @level2name = N'TaskId';

