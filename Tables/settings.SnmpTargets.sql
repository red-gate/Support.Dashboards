CREATE TABLE [settings].[SnmpTargets]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Server] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Port] [int] NOT NULL,
[CommunityString] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[SnmpTargets] ADD CONSTRAINT [SnmpTargets_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
