CREATE TABLE [dbo].[LogTableReturnHistory] (
    [id]                       UNIQUEIDENTIFIER CONSTRAINT [DF_LogTableReturnHistory_id] DEFAULT (newid()) NOT NULL,
    [number]                   INT              IDENTITY (1, 1) NOT NULL,
    [user]                     VARCHAR (100)    CONSTRAINT [DF_LogTableReturnHistory_user] DEFAULT (suser_sname()) NOT NULL,
    [date]                     DATETIME         CONSTRAINT [DF_LogTableReturnHistory_date] DEFAULT (getdate()) NOT NULL,
    [numberML]                 INT              NOT NULL,
    [numberTableReturnHistory] INT              NOT NULL,
    [returnText]               VARCHAR (100)    NOT NULL,
    [sqlCommandType]           NCHAR (10)       NOT NULL,
    CONSTRAINT [PK_LogTableReturnHistory] PRIMARY KEY CLUSTERED ([id] ASC)
);

