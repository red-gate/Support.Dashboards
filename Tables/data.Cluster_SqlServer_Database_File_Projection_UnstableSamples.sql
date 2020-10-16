CREATE TABLE [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Gradient] [float] NULL,
[_Intercept] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_File_Projection_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples] ADD CONSTRAINT [Cluster_SqlServer_Database_File_Projection_UnstableSamples_Cluster_SqlServer_Database_File_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_File_Keys] ([Id]) ON DELETE CASCADE
GO
