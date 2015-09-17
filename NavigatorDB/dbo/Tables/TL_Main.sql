CREATE TABLE [dbo].[TL_Main] (
    [NumML]       INT           IDENTITY (1, 1) NOT NULL,
    [TaskName]    NVARCHAR (50) NULL,
    [ServiceName] NVARCHAR (50) NULL,
    [BasisName]   NVARCHAR (50) NULL,
    [Customer]    NVARCHAR (50) NULL,
    CONSTRAINT [PK_TL_Main] PRIMARY KEY CLUSTERED ([NumML] ASC)
);

