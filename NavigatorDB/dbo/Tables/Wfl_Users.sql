CREATE TABLE [dbo].[Wfl_Users] (
    [AdName]          VARCHAR (32)  NOT NULL,
    [Dept]            INT           NULL,
    [SurName]         VARCHAR (50)  NULL,
    [Name]            VARCHAR (50)  NULL,
    [Patronymic]      VARCHAR (50)  NULL,
    [DeptIdFromLotus] INT           NULL,
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [Email]           NVARCHAR (50) NULL,
    [Phone]           NVARCHAR (50) NULL,
    CONSTRAINT [PK_Wfl_Users] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Wfl_Users_AdnameDept]
    ON [dbo].[Wfl_Users]([AdName] ASC, [Dept] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Внутренний Id подразделения, полученный на основе штатной структуры Lotus.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_Users', @level2type = N'COLUMN', @level2name = N'DeptIdFromLotus';

