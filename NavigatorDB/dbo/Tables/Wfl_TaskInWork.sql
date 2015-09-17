CREATE TABLE [dbo].[Wfl_TaskInWork] (
    [NumML]     INT           NOT NULL,
    [Login]     NVARCHAR (50) NOT NULL,
    [attribute] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Wfl_TaskInWork] PRIMARY KEY CLUSTERED ([NumML] ASC)
);

