CREATE TABLE [data].[Cluster_SqlServer_AccessMethods_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativeFullScans] [bigint] NULL,
[_CumulativePageSplits] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_AccessMethods_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_AccessMethods_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_AccessMethods_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_AccessMethods_UnstableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
