CREATE TABLE [settings].[Group]
(
[GroupId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[Group] ADD CONSTRAINT [Group_GroupId] PRIMARY KEY CLUSTERED  ([GroupId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[Group] ADD CONSTRAINT [Group_Name] UNIQUE NONCLUSTERED  ([Name]) ON [PRIMARY]
GO
