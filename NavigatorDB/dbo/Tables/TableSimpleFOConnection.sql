CREATE TABLE [dbo].[TableSimpleFOConnection] (
    [id]         INT              IDENTITY (1, 1) NOT NULL,
    [AdrStL]     NVARCHAR (150)   NULL,
    [AdrCL]      NVARCHAR (150)   NULL,
    [AdrSocketL] NVARCHAR (150)   NULL,
    [NoteL]      NVARCHAR (250)   NULL,
    [Cabel]      NVARCHAR (50)    NULL,
    [NoteCabel]  NVARCHAR (250)   NULL,
    [AdrStR]     NVARCHAR (150)   NULL,
    [AdrCR]      NVARCHAR (150)   NULL,
    [AdrSocketR] NVARCHAR (150)   NULL,
    [NoteR]      NVARCHAR (250)   NULL,
    [AdrNL]      NVARCHAR (250)   NULL,
    [AdrNR]      NVARCHAR (250)   NULL,
    [Note]       NVARCHAR (250)   NULL,
    [TypeCL]     NVARCHAR (50)    NULL,
    [TypeCR]     NVARCHAR (50)    NULL,
    [FibresL]    NVARCHAR (50)    NULL,
    [FibresR]    NVARCHAR (50)    NULL,
    [rowguid]    UNIQUEIDENTIFIER CONSTRAINT [DF__TableSimp__rowgu__480A8F81] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [PK_TableSimpleFOConnection] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1311604011]
    ON [dbo].[TableSimpleFOConnection]([rowguid] ASC);

