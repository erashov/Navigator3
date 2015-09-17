CREATE TABLE [dbo].[TableTaskUSHTU_UVK] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [taskDateTime] DATETIME       CONSTRAINT [DF_TableTaskUSHTU_UVK_taskDateTime] DEFAULT (getdate()) NULL,
    [taskText]     TEXT           NULL,
    [taskUser]     NVARCHAR (100) CONSTRAINT [DF_TableTaskUSHTU_UVK_taskUser] DEFAULT (suser_sname()) NULL,
    [numberML]     INT            NOT NULL,
    CONSTRAINT [PK_TableTaskUSHTU_UVK] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [IX_TableTaskUSHTU_UVK] UNIQUE NONCLUSTERED ([numberML] ASC)
);

