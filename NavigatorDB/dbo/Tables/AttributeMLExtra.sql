CREATE TABLE [dbo].[AttributeMLExtra] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [NumML]        INT            NOT NULL,
    [AttrName]     NVARCHAR (50)  NULL,
    [AttrFullName] NVARCHAR (255) NULL,
    [AttrValue]    NVARCHAR (512) NULL,
    CONSTRAINT [PK_AttributeMLExtra] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_AttributeMLExtra_7_916914338__K2_3_5_9987]
    ON [dbo].[AttributeMLExtra]([NumML] ASC)
    INCLUDE([AttrName], [AttrValue]);

