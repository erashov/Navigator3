CREATE TABLE [dbo].[Wfl_Depts] (
    [Id]                          INT            NOT NULL,
    [DeptName]                    VARCHAR (50)   NOT NULL,
    [DeptInt]                     VARCHAR (50)   NULL,
    [TaskType]                    INT            NULL,
    [ParentDept]                  INT            NULL,
    [CanBeRouteSheetResponsible]  BIT            NULL,
    [LotusDocId]                  VARCHAR (32)   NULL,
    [RouteSheetListConfiguration] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Wfl_Depts] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Wfl_DeptName]
    ON [dbo].[Wfl_Depts]([DeptName] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Имя файла MSAccess с формами для рабочего места данного подразделения', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_Depts', @level2type = N'COLUMN', @level2name = N'DeptInt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Тип заданий, которые может получать подразделение.
Null - если данному подр. нельзя выдавать задания
"1" - если задание м.б. только одно на МЛ (на оба окончания сразу или независимо от окончаний)
"2" - если задания выдаются на конкретные окончания.

', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_Depts', @level2type = N'COLUMN', @level2name = N'TaskType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Может ли подразделение быть ОУ по МЛ.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_Depts', @level2type = N'COLUMN', @level2name = N'CanBeRouteSheetResponsible';

