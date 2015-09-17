CREATE TABLE [dbo].[Wfl_UsersFilterConfiguration] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (50)   NOT NULL,
    [FilterExpression] NVARCHAR (MAX)  NOT NULL,
    [UserName]         NVARCHAR (50)   NOT NULL,
    [Department]       INT             NOT NULL,
    [CreateDate]       DATE            NULL,
    [Description]      NVARCHAR (1024) NULL,
    [ViewState]        NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_Wfl_UsersFilterConfiguration] PRIMARY KEY CLUSTERED ([Id] ASC)
);

