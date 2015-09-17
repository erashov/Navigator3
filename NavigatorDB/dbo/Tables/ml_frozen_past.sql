CREATE TABLE [dbo].[ml_frozen_past] (
    [NumML]         INT        NOT NULL,
    [signC3]        CHAR (500) NULL,
    [signD1]        DATETIME   NULL,
    [signD2]        DATETIME   NULL,
    [snapshot_date] DATETIME   CONSTRAINT [DF_ml_frozen_past_snapshot_date] DEFAULT (CONVERT([datetime],round(CONVERT([float],getdate(),0),(0),(1)),0)) NULL,
    [id]            INT        IDENTITY (1, 1) NOT NULL
);

