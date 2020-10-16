CREATE TABLE [data].[Cluster_SqlServer_Database_File_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_FileGroupName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_FileName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_GrowthBytes] [bigint] NULL,
[_GrowthPercent] [float] NULL,
[_MaxSize] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_File_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_File_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_File_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_File_StableSamples_Cluster_SqlServer_Database_File_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_File_Keys] ([Id]) ON DELETE CASCADE
GO
