CREATE TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_LoginName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ProgramName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_QueryWaitStats_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_QueryWaitStats_StableSamples_Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ([Id]) ON DELETE CASCADE
GO
