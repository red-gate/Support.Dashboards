CREATE TABLE [data].[Cluster_SqlServer_Database_Table_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CreateDate] [bigint] NULL,
[_ModifyDate] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_StableSamples_Cluster_SqlServer_Database_Table_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_Table_Keys] ([Id]) ON DELETE CASCADE
GO
