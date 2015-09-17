CREATE TABLE [dbo].[UltTaskSubcontrInfo] (
    [CID]                NVARCHAR (100) NOT NULL,
    [NumML]              INT            NOT NULL,
    [ACTIVE_NETTERM_NUM] INT            NOT NULL,
    [CHANNELS]           NVARCHAR (255) NULL,
    [FROM_CITY]          NVARCHAR (150) NULL,
    [FROM_STREET]        NVARCHAR (150) NULL,
    [FROM_HOUSE]         NVARCHAR (10)  NULL,
    [FROM_CORP]          NVARCHAR (120) NULL,
    [FROM_BLD]           NVARCHAR (120) NULL,
    [FROM_OWN]           NVARCHAR (120) NULL,
    [FROM_FLOOR]         NVARCHAR (120) NULL,
    [FROM_ROOM]          NVARCHAR (120) NULL,
    CONSTRAINT [PK_UltTaskSubcontrInfo] PRIMARY KEY CLUSTERED ([CID] ASC),
    CONSTRAINT [FK_UltTaskSubcontrInfo_Osnova] FOREIGN KEY ([NumML]) REFERENCES [dbo].[Osnova] ([NumML])
);

