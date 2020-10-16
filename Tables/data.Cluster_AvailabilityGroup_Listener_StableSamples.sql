CREATE TABLE [data].[Cluster_AvailabilityGroup_Listener_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ListenerIpAddress] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ListenerPort] [bigint] NULL,
[_ListenerState] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Listener_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Listener_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Listener_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Listener_StableSamples_Cluster_AvailabilityGroup_Listener_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Listener_Keys] ([Id]) ON DELETE CASCADE
GO
