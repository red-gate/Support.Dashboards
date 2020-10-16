CREATE TABLE [data].[Cluster_AvailabilityGroup_Listener_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ListenerDnsName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Listener_Keys] ADD CONSTRAINT [Cluster_AvailabilityGroup_Listener_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_AvailabilityGroup_Listener_Keys_CollectionDate] ON [data].[Cluster_AvailabilityGroup_Listener_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Listener_Keys] ADD CONSTRAINT [Cluster_AvailabilityGroup_Listener_Keys_ParentId__ListenerDnsName] UNIQUE NONCLUSTERED  ([ParentId], [_ListenerDnsName]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Listener_Keys] ADD CONSTRAINT [Cluster_AvailabilityGroup_Listener_Keys_Cluster_AvailabilityGroup_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_AvailabilityGroup_Keys] ([Id]) ON DELETE CASCADE
GO
