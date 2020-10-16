CREATE TABLE [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Fragmentation] [float] NULL,
[_Pages] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_Index_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_Index_UnstableSamples_Cluster_SqlServer_Database_Table_Index_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_Table_Index_Keys] ([Id]) ON DELETE CASCADE
GO
