CREATE TABLE [dbo].[TableConnectionFO] (
    [id]                   INT              IDENTITY (1, 1) NOT NULL,
    [NumML]                INT              NULL,
    [ConnectionA]          NVARCHAR (150)   NULL,
    [ConnectionB]          NVARCHAR (150)   NULL,
    [NoteA]                NVARCHAR (150)   NULL,
    [NoteB]                NVARCHAR (150)   NULL,
    [dateCreate]           DATETIME         CONSTRAINT [DF_TableConnectionFO_dateCreate] DEFAULT (getdate()) NULL,
    [ReportForConnectionA] NVARCHAR (150)   NULL,
    [ReportForConnectionB] NVARCHAR (150)   NULL,
    [ReportNoteA]          NVARCHAR (150)   NULL,
    [ReportNoteB]          NVARCHAR (150)   NULL,
    [dateReport]           DATETIME         CONSTRAINT [DF_TableConnectionFO_dateReport] DEFAULT (getdate()) NULL,
    [rowguid]              UNIQUEIDENTIFIER CONSTRAINT [DF__TableConn__rowgu__4DC368D7] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [taskFile]             TEXT             NULL,
    [reportFile]           TEXT             NULL,
    CONSTRAINT [PK_TableConnectionFO] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1263603840]
    ON [dbo].[TableConnectionFO]([rowguid] ASC);


GO
CREATE NONCLUSTERED INDEX [Index_NumML]
    ON [dbo].[TableConnectionFO]([NumML] ASC)
    INCLUDE([id]);

