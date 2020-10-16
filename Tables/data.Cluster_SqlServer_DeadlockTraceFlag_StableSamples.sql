CREATE TABLE [data].[Cluster_SqlServer_DeadlockTraceFlag_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_DeadlockTraceFlag] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_DeadlockTraceFlag_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_DeadlockTraceFlag_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_DeadlockTraceFlag_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_DeadlockTraceFlag_StableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
