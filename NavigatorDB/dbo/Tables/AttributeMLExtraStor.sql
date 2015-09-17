CREATE TABLE [dbo].[AttributeMLExtraStor] (
    [Id]        INT            NOT NULL,
    [Numml]     INT            NOT NULL,
    [Attribute] NVARCHAR (255) NULL,
    [Value]     NVARCHAR (MAX) NULL,
    PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

