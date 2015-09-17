CREATE TABLE [dbo].[Lchr_Files] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (50) NOT NULL,
    [FileName]      VARCHAR (50) NOT NULL,
    [CopyAtStartUp] DATETIME     NULL
);

