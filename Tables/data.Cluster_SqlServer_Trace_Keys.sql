CREATE TABLE [data].[Cluster_SqlServer_Trace_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_SequenceNumber] [bigint] NOT NULL,
[_StartTime] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Trace_Keys] ADD CONSTRAINT [Cluster_SqlServer_Trace_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Trace_Keys__StartTime] ON [data].[Cluster_SqlServer_Trace_Keys] ([_StartTime]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Trace_Keys] ADD CONSTRAINT [Cluster_SqlServer_Trace_Keys_ParentId__StartTime__SequenceNumber] UNIQUE NONCLUSTERED  ([ParentId], [_StartTime], [_SequenceNumber]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Trace_Keys] ADD CONSTRAINT [Cluster_SqlServer_Trace_Keys_Cluster_SqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
