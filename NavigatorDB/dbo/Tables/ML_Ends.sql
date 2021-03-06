﻿CREATE TABLE [dbo].[ML_Ends] (
    [NumMl]        INT             NOT NULL,
    [Okonchanie]   NVARCHAR (25)   NOT NULL,
    [Styk]         NVARCHAR (100)  NULL,
    [Styk1]        NVARCHAR (100)  NULL,
    [Line_Priv]    NVARCHAR (100)  NULL,
    [Status_Styka] NVARCHAR (100)  NULL,
    [Param_Styka]  NVARCHAR (50)   NULL,
    [Adres]        NVARCHAR (255)  NULL,
    [Kontakt]      NVARCHAR (255)  NULL,
    [Dop]          NVARCHAR (1024) NULL,
    [ML_Dostupa]   NVARCHAR (100)  NULL,
    [VPN]          NVARCHAR (100)  NULL,
    [ASNum]        NVARCHAR (100)  NULL,
    [GatewayAdres] NVARCHAR (100)  NULL,
    [NetAdres]     NVARCHAR (100)  NULL,
    [NetMask]      NVARCHAR (100)  NULL,
    [RouteType]    NVARCHAR (255)  NULL,
    [Adres_Old]    NVARCHAR (255)  NULL,
    [ChangeAddr]   NVARCHAR (128)  NULL,
    [CameraModel]  NVARCHAR (100)  NULL,
    [NumC]         NVARCHAR (100)  NULL,
    [NatEquipment] NVARCHAR (512)  NULL,
    [IpType]       NVARCHAR (255)  NULL,
    [num_rosette]  NVARCHAR (256)  NULL,
    [crypto]       NVARCHAR (256)  NULL,
    CONSTRAINT [PK__ML_N_Ends__674A37FD] PRIMARY KEY NONCLUSTERED ([NumMl] ASC, [Okonchanie] ASC)
);

