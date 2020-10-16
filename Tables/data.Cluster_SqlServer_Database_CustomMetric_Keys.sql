CREATE TABLE [data].[Cluster_SqlServer_Database_CustomMetric_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_MetricId] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_CustomMetric_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_CustomMetric_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Database_CustomMetric_Keys_CollectionDate] ON [data].[Cluster_SqlServer_Database_CustomMetric_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_CustomMetric_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_CustomMetric_Keys_ParentId__MetricId] UNIQUE NONCLUSTERED  ([ParentId], [_MetricId]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_CustomMetric_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_CustomMetric_Keys_Cluster_SqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
