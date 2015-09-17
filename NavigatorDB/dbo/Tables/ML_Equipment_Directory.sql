CREATE TABLE [dbo].[ML_Equipment_Directory] (
    [UnitId]      INT             NOT NULL,
    [Equipment]   NVARCHAR (500)  NOT NULL,
    [SerialNum]   NVARCHAR (255)  NULL,
    [CostOne]     DECIMAL (19, 2) NULL,
    [Designation] NVARCHAR (255)  NULL,
    [Id]          INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    CONSTRAINT [PK__ML_N_Equipment_D__03E676AB] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

