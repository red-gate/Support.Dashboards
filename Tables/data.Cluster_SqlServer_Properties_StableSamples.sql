CREATE TABLE [data].[Cluster_SqlServer_Properties_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Collation] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_Edition] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_IsClustered] [bit] NULL,
[_IsSingleUser] [bit] NULL,
[_IsVirtualMachine] [bigint] NULL,
[_ProductLevel] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ProductVersion] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Properties_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Properties_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Properties_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Properties_StableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
