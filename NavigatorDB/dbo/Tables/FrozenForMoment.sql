CREATE TABLE [dbo].[FrozenForMoment] (
    [Numml]        INT             NULL,
    [zakazhcik]    NVARCHAR (255)  NULL,
    [usluga]       NVARCHAR (255)  NULL,
    [utverzh_b]    DATETIME        NULL,
    [signC3]       NVARCHAR (1024) NULL,
    [signD1]       DATETIME        NULL,
    [disconnect]   INT             NULL,
    [freezereason] NVARCHAR (255)  NULL,
    [AddDate]      DATETIME        NULL
);

