CREATE TABLE [data].[Cluster_SqlServer_ServerWaits_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_SignalWaitTime] [bigint] NULL,
[_WaitingTasksCount] [bigint] NULL,
[_WaitTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_ServerWaits_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_ServerWaits_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_ServerWaits_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_ServerWaits_UnstableSamples_Cluster_SqlServer_ServerWaits_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_ServerWaits_Keys] ([Id]) ON DELETE CASCADE
GO
