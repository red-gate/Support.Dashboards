CREATE TABLE [data].[Cluster_SqlServer_Cluster_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_NodeName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ResourceGroupName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ResourceGroupState] [bigint] NULL,
[_State] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Cluster_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Cluster_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Cluster_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Cluster_StableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
