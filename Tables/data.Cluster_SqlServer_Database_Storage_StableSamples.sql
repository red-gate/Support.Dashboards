CREATE TABLE [data].[Cluster_SqlServer_Database_Storage_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_TotalDataSizeBytes] [bigint] NULL,
[_TotalLogSizeBytes] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Storage_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Storage_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Storage_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Storage_StableSamples_Cluster_SqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
