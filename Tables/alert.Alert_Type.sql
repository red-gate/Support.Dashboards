CREATE TABLE [alert].[Alert_Type]
(
[AlertType] [int] NOT NULL,
[Event] [tinyint] NOT NULL,
[Name] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DF_Alert_Type_Name] DEFAULT (''),
[Description] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DF_Alert_Type_Description] DEFAULT (''),
[ShortName] [nvarchar] (28) COLLATE Latin1_General_CI_AS NULL,
[Priority] [smallint] NOT NULL CONSTRAINT [DF_Alert_Type_Priority] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [alert].[Alert_Type] ADD CONSTRAINT [Alert_Type_AlertType] PRIMARY KEY CLUSTERED  ([AlertType]) ON [PRIMARY]
GO
