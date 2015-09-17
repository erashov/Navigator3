CREATE TABLE [dbo].[ML_History] (
    [ID]          DECIMAL (19)    IDENTITY (1, 1) NOT NULL,
    [NumML]       INT             NOT NULL,
    [Step]        INT             NOT NULL,
    [StartTime]   DATETIME        NOT NULL,
    [EndTime]     DATETIME        NULL,
    [Comment]     NVARCHAR (2048) NULL,
    [userName]    NVARCHAR (100)  CONSTRAINT [DF_ML_History_userName] DEFAULT (suser_sname()) NULL,
    [stepID_link] INT             NULL,
    [department]  NVARCHAR (32)   NULL,
    [NetTerm_num] INT             NULL,
    [canceled]    INT             NULL,
    [timestamp]   ROWVERSION      NOT NULL,
    [Commentary]  NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_ML_History] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [Index_NumML]
    ON [dbo].[ML_History]([NumML] ASC, [Step] ASC, [EndTime] ASC, [department] ASC);


GO
CREATE NONCLUSTERED INDEX [Index_Step]
    ON [dbo].[ML_History]([Step] ASC, [NumML] ASC)
    INCLUDE([StartTime], [EndTime]);

