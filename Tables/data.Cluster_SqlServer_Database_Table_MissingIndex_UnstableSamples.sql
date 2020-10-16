CREATE TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_AverageCost] [float] NULL,
[_AverageImpact] [float] NULL,
[_LastUserScan] [bigint] NULL,
[_LastUserSeek] [bigint] NULL,
[_UniqueCompiles] [bigint] NULL,
[_UserScans] [bigint] NULL,
[_UserSeeks] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_MissingIndex_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_MissingIndex_UnstableSamples_Cluster_SqlServer_Database_Table_MissingIndex_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ([Id]) ON DELETE CASCADE
GO
