CREATE TABLE [data].[Cluster_SqlServer_ExtendedEvents_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_EventName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[_Sequence] [bigint] NOT NULL,
[_TimeStamp] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_ExtendedEvents_Keys] ADD CONSTRAINT [Cluster_SqlServer_ExtendedEvents_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_ExtendedEvents_Keys_CollectionDate] ON [data].[Cluster_SqlServer_ExtendedEvents_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_ExtendedEvents_Keys] ADD CONSTRAINT [Cluster_SqlServer_ExtendedEvents_Keys_ParentId__EventName__Sequence__TimeStamp] UNIQUE NONCLUSTERED  ([ParentId], [_EventName], [_Sequence], [_TimeStamp]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_ExtendedEvents_Keys] ADD CONSTRAINT [Cluster_SqlServer_ExtendedEvents_Keys_Cluster_SqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
