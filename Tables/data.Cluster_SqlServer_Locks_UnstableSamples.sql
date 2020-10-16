CREATE TABLE [data].[Cluster_SqlServer_Locks_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativeDeadlocks] [bigint] NULL,
[_CumulativeLockTimeouts] [bigint] NULL,
[_CumulativeLockWaits] [bigint] NULL,
[_CumulativeLockWaitTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Locks_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Locks_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Locks_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Locks_UnstableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
