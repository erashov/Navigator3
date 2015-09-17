CREATE TABLE [dbo].[ML_EquipUnit] (
    [UnitId]        INT            NOT NULL,
    [UnitName]      NVARCHAR (100) NOT NULL,
    [UnitShortName] NVARCHAR (50)  NULL,
    CONSTRAINT [PK__ML_N_EquipUnit__5AE46118] PRIMARY KEY NONCLUSTERED ([UnitId] ASC)
);

