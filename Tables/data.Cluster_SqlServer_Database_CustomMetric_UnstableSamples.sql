CREATE TABLE [data].[Cluster_SqlServer_Database_CustomMetric_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Value] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_CustomMetric_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_CustomMetric_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_CustomMetric_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_CustomMetric_UnstableSamples_Cluster_SqlServer_Database_CustomMetric_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_CustomMetric_Keys] ([Id]) ON DELETE CASCADE
GO
