CREATE TABLE [data].[Cluster_SqlServer_TopQueries_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CreateDate] [bigint] NULL,
[_PlanHandle] [varbinary] (max) NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_StableSamples_Cluster_SqlServer_TopQueries_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_TopQueries_Keys] ([Id]) ON DELETE CASCADE
GO
