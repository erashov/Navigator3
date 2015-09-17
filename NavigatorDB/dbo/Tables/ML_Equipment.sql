CREATE TABLE [dbo].[ML_Equipment] (
    [NumMl]             INT             NOT NULL,
    [Data_Organiz]      NVARCHAR (23)   NULL,
    [Otvetstv_Organiz]  NVARCHAR (100)  NULL,
    [Predst_Zakazchika] NVARCHAR (100)  NULL,
    [Inf_Data]          NVARCHAR (23)   NULL,
    [Summa]             DECIMAL (19, 2) NULL,
    CONSTRAINT [PK__ML_N_Equipment__58FC18A6] PRIMARY KEY NONCLUSTERED ([NumMl] ASC)
);

