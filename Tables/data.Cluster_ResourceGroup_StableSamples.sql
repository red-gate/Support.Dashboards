CREATE TABLE [data].[Cluster_ResourceGroup_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Description] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_Node] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_State] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_ResourceGroup_StableSamples] ADD CONSTRAINT [Cluster_ResourceGroup_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_ResourceGroup_StableSamples] ADD CONSTRAINT [Cluster_ResourceGroup_StableSamples_Cluster_ResourceGroup_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_ResourceGroup_Keys] ([Id]) ON DELETE CASCADE
GO
