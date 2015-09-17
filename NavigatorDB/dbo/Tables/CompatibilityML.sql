CREATE TABLE [dbo].[CompatibilityML] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [GroupID]    INT           NOT NULL,
    [NumML]      INT           NOT NULL,
    [CreateDate] DATE          NULL,
    [UserCreate] NVARCHAR (50) NULL,
    [DeptID]     INT           NULL,
    CONSTRAINT [PK_CompatibilityML] PRIMARY KEY CLUSTERED ([ID] ASC)
);

