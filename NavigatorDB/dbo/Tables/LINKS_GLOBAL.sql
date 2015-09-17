CREATE TABLE [dbo].[LINKS_GLOBAL] (
    [link_id]           INT           IDENTITY (1, 1) NOT NULL,
    [link_title]        VARCHAR (MAX) NULL,
    [link_desc]         VARCHAR (MAX) NULL,
    [link_url]          VARCHAR (MAX) NULL,
    [link_count_usings] INT           CONSTRAINT [DF__LINKS_GLO__link___7325FEFD] DEFAULT ((0)) NULL,
    [link_parent_id]    INT           CONSTRAINT [DF__LINKS_GLO__link___741A2336] DEFAULT ((0)) NULL,
    [date_created]      DATETIME      CONSTRAINT [DF__LINKS_GLO__date___750E476F] DEFAULT (getdate()) NULL,
    [date_last_updated] DATETIME      CONSTRAINT [DF__LINKS_GLO__date___76026BA8] DEFAULT (getdate()) NULL,
    [link_level]        INT           CONSTRAINT [DF__LINKS_GLO__link___76F68FE1] DEFAULT ((0)) NULL,
    [link_comment]      VARCHAR (MAX) NULL,
    [link_project]      VARCHAR (MAX) NULL,
    [is_active]         INT           CONSTRAINT [DF__LINKS_GLO__is_ac__77EAB41A] DEFAULT ((1)) NULL,
    CONSTRAINT [PK__LINKS_GLOBAL__7231DAC4] PRIMARY KEY CLUSTERED ([link_id] ASC)
);

