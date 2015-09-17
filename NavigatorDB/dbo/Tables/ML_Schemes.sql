CREATE TABLE [dbo].[ML_Schemes] (
    [NumMl]  INT             NOT NULL,
    [Scheme] VARBINARY (MAX) NULL,
    [Excel]  IMAGE           NULL,
    PRIMARY KEY NONCLUSTERED ([NumMl] ASC)
);

