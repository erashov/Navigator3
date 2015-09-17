CREATE TABLE [dbo].[pacporta_neispr] (
    [FIO]        NVARCHAR (100) NULL,
    [KONTEL]     NVARCHAR (100) NULL,
    [JALOBA]     NTEXT          NULL,
    [TIMEOBR]    DATETIME       NULL,
    [DATAOBR]    DATETIME       NULL,
    [FIOOPER]    NVARCHAR (30)  NULL,
    [ZAKAZ]      NVARCHAR (100) NULL,
    [NOMERPASP]  INT            NULL,
    [PRICHINA]   NTEXT          NULL,
    [ISTORI]     TEXT           NULL,
    [PRIMECHAN]  NTEXT          NULL,
    [TAIMVOZOBN] DATETIME       NULL,
    [DATAVOZOBN] DATETIME       NULL,
    [USLUGA]     NVARCHAR (100) NULL,
    [ADRESА]     NVARCHAR (255) NULL,
    [ADRESB]     NVARCHAR (255) NULL,
    [NOMERAC]    NVARCHAR (3)   NULL,
    [kod]        INT            IDENTITY (1, 1) NOT NULL
);

