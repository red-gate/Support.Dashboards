CREATE TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_WaitTime] [bigint] NULL,
[_WaitTimeCount] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples_Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ([Id]) ON DELETE CASCADE
GO
