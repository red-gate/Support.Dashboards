CREATE TABLE [data].[Cluster_SqlServer_MemoryManager_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_FreeMemoryBytes] [bigint] NULL,
[_TargetServerMemoryBytes] [bigint] NULL,
[_TotalServerMemoryBytes] [bigint] NULL,
[_ConnectionMemoryBytes] [bigint] NULL,
[_DatabaseCacheMemoryBytes] [bigint] NULL,
[_LockMemoryBytes] [bigint] NULL,
[_LogPoolMemoryBytes] [bigint] NULL,
[_OptimizerMemoryBytes] [bigint] NULL,
[_PlanCacheMemoryBytes] [bigint] NULL,
[_ReservedMemoryBytes] [bigint] NULL,
[_WorkspaceMemoryBytes] [bigint] NULL,
[_MaximumWorkspaceMemoryBytes] [bigint] NULL,
[_StolenServerMemoryBytes] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_MemoryManager_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_MemoryManager_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_MemoryManager_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_MemoryManager_UnstableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
