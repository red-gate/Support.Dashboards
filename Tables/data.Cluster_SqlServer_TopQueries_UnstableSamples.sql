CREATE TABLE [data].[Cluster_SqlServer_TopQueries_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ExecutionCount] [bigint] NULL,
[_ExecutionTime] [bigint] NULL,
[_LogicalReads] [bigint] NULL,
[_LogicalWrites] [bigint] NULL,
[_PhysicalReads] [bigint] NULL,
[_WorkerTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_UnstableSamples_Cluster_SqlServer_TopQueries_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_TopQueries_Keys] ([Id]) ON DELETE CASCADE
GO
