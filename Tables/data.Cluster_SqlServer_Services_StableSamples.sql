CREATE TABLE [data].[Cluster_SqlServer_Services_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ServiceState] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_Startup] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Services_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Services_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Services_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Services_StableSamples_Cluster_SqlServer_Services_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Services_Keys] ([Id]) ON DELETE CASCADE
GO
