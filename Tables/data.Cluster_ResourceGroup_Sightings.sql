CREATE TABLE [data].[Cluster_ResourceGroup_Sightings]
(
[Id] [bigint] NOT NULL,
[SightingDate] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_ResourceGroup_Sightings] ADD CONSTRAINT [Cluster_ResourceGroup_Sightings_SightingDate_Id] PRIMARY KEY CLUSTERED  ([SightingDate], [Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_ResourceGroup_Sightings_Id] ON [data].[Cluster_ResourceGroup_Sightings] ([Id], [SightingDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_ResourceGroup_Sightings] ADD CONSTRAINT [Cluster_ResourceGroup_Sightings_Cluster_ResourceGroup_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_ResourceGroup_Keys] ([Id]) ON DELETE CASCADE
GO
