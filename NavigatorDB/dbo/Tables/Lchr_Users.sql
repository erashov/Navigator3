CREATE TABLE [dbo].[Lchr_Users] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [ADname]   VARCHAR (70)  NOT NULL,
    [FullName] VARCHAR (150) NULL,
    CONSTRAINT [PK_Lchr_Users] PRIMARY KEY CLUSTERED ([id] ASC)
);

