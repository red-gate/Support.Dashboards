CREATE TABLE [data].[Cluster_AvailabilityGroup_Listener_Sightings]
(
[Id] [bigint] NOT NULL,
[SightingDate] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Listener_Sightings] ADD CONSTRAINT [Cluster_AvailabilityGroup_Listener_Sightings_SightingDate_Id] PRIMARY KEY CLUSTERED  ([SightingDate], [Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_AvailabilityGroup_Listener_Sightings_Id] ON [data].[Cluster_AvailabilityGroup_Listener_Sightings] ([Id], [SightingDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Listener_Sightings] ADD CONSTRAINT [Cluster_AvailabilityGroup_Listener_Sightings_Cluster_AvailabilityGroup_Listener_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Listener_Keys] ([Id]) ON DELETE CASCADE
GO
