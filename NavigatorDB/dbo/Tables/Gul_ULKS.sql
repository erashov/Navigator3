CREATE TABLE [dbo].[Gul_ULKS] (
    [NumML]       INT              CONSTRAINT [DF__Gul_ULKS__NumML__30F848ED] DEFAULT (0) NULL,
    [G_A]         BIT              CONSTRAINT [DF__Gul_ULKS__G_A__31EC6D26] DEFAULT (0) NULL,
    [G_B]         BIT              CONSTRAINT [DF__Gul_ULKS__G_B__32E0915F] DEFAULT (0) NULL,
    [Data_Sost_A] DATETIME         NULL,
    [Data_Sost_B] DATETIME         NULL,
    [Data_Vypt_A] DATETIME         NULL,
    [Data_Vypt_B] DATETIME         NULL,
    [rowguid]     UNIQUEIDENTIFIER CONSTRAINT [DF__Gul_ULKS__rowgui__40257DE4] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_805577908]
    ON [dbo].[Gul_ULKS]([rowguid] ASC);

