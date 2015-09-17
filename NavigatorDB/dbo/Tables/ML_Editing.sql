CREATE TABLE [dbo].[ML_Editing] (
    [NumML]     INT            NOT NULL,
    [IsEditing] INT            NULL,
    [UserName]  NVARCHAR (255) NULL,
    PRIMARY KEY NONCLUSTERED ([NumML] ASC)
);

