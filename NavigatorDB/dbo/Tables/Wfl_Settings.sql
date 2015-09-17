CREATE TABLE [dbo].[Wfl_Settings] (
    [Code]        NVARCHAR (50)   NOT NULL,
    [Description] NVARCHAR (512)  NULL,
    [DataTypeId]  INT             NULL,
    [Value]       NVARCHAR (1024) NULL,
    [ValueText]   NVARCHAR (MAX)  NULL,
    [UserName]    NVARCHAR (32)   NULL,
    [id]          INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [FK_DataType_For_Setting] FOREIGN KEY ([DataTypeId]) REFERENCES [dbo].[Wfl_DataTypes] ([DataTypeId]) ON DELETE SET NULL ON UPDATE CASCADE
);


GO
EXECUTE sp_tableoption @TableNamePattern = N'[dbo].[Wfl_Settings]', @OptionName = N'large value types out of row', @OptionValue = N'1';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Wfl_Settings]
    ON [dbo].[Wfl_Settings]([Code] ASC, [UserName] ASC);

