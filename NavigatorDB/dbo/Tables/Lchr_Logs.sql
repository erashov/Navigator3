CREATE TABLE [dbo].[Lchr_Logs] (
    [id]                 INT           IDENTITY (1, 1) NOT NULL,
    [userid]             INT           NULL,
    [userad]             VARCHAR (70)  NOT NULL,
    [fileid]             INT           NULL,
    [filename]           VARCHAR (255) NOT NULL,
    [date]               DATETIME      NOT NULL,
    [numml]              NCHAR (10)    NULL,
    [actions]            NVARCHAR (50) CONSTRAINT [DF_Lchr_Logs_actions] DEFAULT (N'open') NOT NULL,
    [SendMsg2UIIAS]      INT           NULL,
    [createFoConnection] INT           NULL,
    [office]             NVARCHAR (9)  NULL,
    CONSTRAINT [PK_Lchr_Logs] PRIMARY KEY CLUSTERED ([id] ASC)
);

