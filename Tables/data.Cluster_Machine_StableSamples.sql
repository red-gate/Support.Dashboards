CREATE TABLE [data].[Cluster_Machine_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_IsReachable] [bit] NULL,
[_IsReadyForDataCollection] [bit] NULL,
[_MonitoredEntityState] [bigint] NULL,
[_MonitoringStatusCategory] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_StableSamples] ADD CONSTRAINT [Cluster_Machine_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_StableSamples] ADD CONSTRAINT [Cluster_Machine_StableSamples_Cluster_Machine_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Keys] ([Id]) ON DELETE CASCADE
GO
