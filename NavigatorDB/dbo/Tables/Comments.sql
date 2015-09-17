CREATE TABLE [dbo].[Comments] (
    [CommentId]     INT             IDENTITY (1, 1) NOT NULL,
    [DateQuestion]  DATETIME        NULL,
    [UserSender]    NVARCHAR (100)  NULL,
    [UserRecipient] NVARCHAR (100)  NULL,
    [Question]      NVARCHAR (4000) NULL,
    [UserNameTo]    NVARCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([CommentId] ASC)
);

