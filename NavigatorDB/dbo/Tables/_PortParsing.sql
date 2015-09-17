CREATE TABLE [dbo].[_PortParsing] (
    [NomerKanala] NVARCHAR (50)  NOT NULL,
    [Astahov1]    NVARCHAR (250) NULL,
    [Port]        NVARCHAR (250) NULL,
    [VLAN]        NVARCHAR (250) NULL,
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [PrivA]       NVARCHAR (255) NULL,
    CONSTRAINT [PK__PortParsing] PRIMARY KEY CLUSTERED ([NomerKanala] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[_PortParsing] TO PUBLIC
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[_PortParsing] TO PUBLIC
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[_PortParsing] TO PUBLIC
    AS [dbo];

