CREATE TABLE [dbo].[Wfl_Interfaces] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ADName]        NVARCHAR (50)  NOT NULL,
    [InterfacePath] NVARCHAR (150) NOT NULL,
    [ISadmin]       INT            CONSTRAINT [DF_Wfl_Interfaces_ISadmin] DEFAULT ((0)) NULL,
    [InterfaceName] NCHAR (50)     NULL,
    CONSTRAINT [PK_Wfl_Interfaces] PRIMARY KEY CLUSTERED ([ID] ASC)
);

