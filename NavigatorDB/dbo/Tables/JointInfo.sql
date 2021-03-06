﻿CREATE TABLE [dbo].[JointInfo] (
    [NumML]          INT            NOT NULL,
    [AdressA]        NVARCHAR (255) NULL,
    [AdressB]        NVARCHAR (255) NULL,
    [ChNumA]         NVARCHAR (50)  NULL,
    [ChNumB]         NVARCHAR (50)  NULL,
    [JointA]         NCHAR (50)     NULL,
    [JointB]         NCHAR (50)     NULL,
    [JointStatusA]   NCHAR (50)     NULL,
    [JointStatusB]   NCHAR (50)     NULL,
    [JointParamA]    NCHAR (20)     NULL,
    [JointParamB]    NCHAR (20)     NULL,
    [LineA]          NCHAR (10)     NULL,
    [LineB]          NCHAR (10)     NULL,
    [ChannelInfoA]   NCHAR (10)     NULL,
    [ChannelInfoB]   NCHAR (10)     NULL,
    [EqiupmentA]     NCHAR (255)    NULL,
    [EqiupmentB]     NCHAR (255)    NULL,
    [OperatorA]      NCHAR (128)    NULL,
    [OperatorB]      NCHAR (128)    NULL,
    [JointIdA]       INT            NULL,
    [JointIdB]       INT            NULL,
    [SOChSkorostA]   NCHAR (64)     NULL,
    [SOChSkorostB]   NCHAR (64)     NULL,
    [SOChInterfaceA] NCHAR (50)     NULL,
    [SOChInterfaceB] NCHAR (50)     NULL,
    [DMVManagerA]    NCHAR (100)    NULL,
    [DMVManagerB]    NCHAR (100)    NULL,
    CONSTRAINT [PK_JointInfo] PRIMARY KEY CLUSTERED ([NumML] ASC)
);

