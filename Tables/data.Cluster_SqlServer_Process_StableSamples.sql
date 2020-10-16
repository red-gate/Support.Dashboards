CREATE TABLE [data].[Cluster_SqlServer_Process_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Id] [bigint] NULL,
[_Name] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_StartDate] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Process_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Process_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Process_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Process_StableSamples_Cluster_SqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
