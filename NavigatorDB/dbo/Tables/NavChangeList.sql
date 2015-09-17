CREATE TABLE [dbo].[NavChangeList] (
    [_Id]      INT           IDENTITY (1, 1) NOT NULL,
    [_DateLog] DATETIME      DEFAULT (getdate()) NULL,
    [_UserId]  INT           DEFAULT (user_id()) NULL,
    [NumML]    INT           NOT NULL,
    [Adres_A]  VARCHAR (255) NULL,
    [Adres_B]  VARCHAR (255) NULL,
    [town1]    VARCHAR (150) NULL,
    [Street1]  VARCHAR (150) NULL,
    [Dom1]     VARCHAR (10)  NULL,
    [Str1]     VARCHAR (120) NULL,
    [Kor1]     VARCHAR (120) NULL,
    [flow1]    VARCHAR (150) NULL,
    [romm1]    VARCHAR (150) NULL,
    [town2]    VARCHAR (150) NULL,
    [Street2]  VARCHAR (150) NULL,
    [Dom2]     VARCHAR (10)  NULL,
    [Str2]     VARCHAR (120) NULL,
    [Kor2]     VARCHAR (120) NULL,
    [flow2]    VARCHAR (150) NULL,
    [romm2]    VARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([_Id] ASC)
);

