﻿CREATE TABLE [dbo].[Таблица_АС] (
    [NOMERAC]    INT           IDENTITY (1, 1) NOT NULL,
    [TIMEOPENAC] NVARCHAR (5)  NULL,
    [DATAOPENAC] NVARCHAR (8)  NULL,
    [UPRAVLENIE] NVARCHAR (30) NULL,
    [DEGOPER]    NVARCHAR (30) NULL,
    [OPISANIEAC] NTEXT         NULL,
    [dispetcher] NVARCHAR (50) NULL
);

