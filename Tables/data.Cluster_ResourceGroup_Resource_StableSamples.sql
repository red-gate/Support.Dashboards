CREATE TABLE [data].[Cluster_ResourceGroup_Resource_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Description] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_State] [bigint] NULL,
[_Type] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_ResourceGroup_Resource_StableSamples] ADD CONSTRAINT [Cluster_ResourceGroup_Resource_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_ResourceGroup_Resource_StableSamples] ADD CONSTRAINT [Cluster_ResourceGroup_Resource_StableSamples_Cluster_ResourceGroup_Resource_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_ResourceGroup_Resource_Keys] ([Id]) ON DELETE CASCADE
GO
