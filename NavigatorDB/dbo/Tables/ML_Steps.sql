CREATE TABLE [dbo].[ML_Steps] (
    [ID]       INT           IDENTITY (1, 1) NOT NULL,
    [stepName] NVARCHAR (64) NULL,
    CONSTRAINT [PK_ML_Steps] PRIMARY KEY CLUSTERED ([ID] ASC)
);

