CREATE TABLE [dbo].[Wfl_EquipmentDepart] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [Equipment] NVARCHAR (255) NULL,
    [Depart]    INT            NULL,
    CONSTRAINT [PK_Wfl_EquipmentDepart] PRIMARY KEY CLUSTERED ([id] ASC)
);

