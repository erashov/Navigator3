CREATE TABLE [dbo].[Questions] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [DateTimeQuestion] DATETIME       NULL,
    [User]             NVARCHAR (100) NULL,
    [Question]         NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

