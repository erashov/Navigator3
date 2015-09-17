CREATE TABLE [dbo].[Area] (
    [Id]         INT            NOT NULL,
    [ShortName]  NVARCHAR (10)  NULL,
    [FolderPath] NVARCHAR (255) NULL,
    CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED ([Id] ASC)
);

