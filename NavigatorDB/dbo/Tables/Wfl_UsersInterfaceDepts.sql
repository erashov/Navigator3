CREATE TABLE [dbo].[Wfl_UsersInterfaceDepts] (
    [AdName] VARCHAR (32) NOT NULL,
    [DeptId] INT          NOT NULL,
    CONSTRAINT [PK_UsersInterfaceDepts] PRIMARY KEY CLUSTERED ([AdName] ASC, [DeptId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Список подразделений, от имени которых может работать пользователь', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_UsersInterfaceDepts';

