CREATE TABLE [dbo].[TableReturnTypes] (
    [id]         UNIQUEIDENTIFIER CONSTRAINT [DF_TableReturnTypes_id] DEFAULT (newid()) NOT NULL,
    [typeNumber] INT              IDENTITY (1, 1) NOT NULL,
    [typeName]   NVARCHAR (100)   NULL,
    CONSTRAINT [PK_TableReturnTypes] PRIMARY KEY CLUSTERED ([id] ASC)
);

