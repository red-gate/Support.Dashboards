CREATE TABLE [data].[Cluster_SqlServer_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_IsReachable] [bit] NULL,
[_IsReadyForDataCollection] [bit] NULL,
[_MonitoredEntityState] [bigint] NULL,
[_MonitoringStatusCategory] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_StableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
