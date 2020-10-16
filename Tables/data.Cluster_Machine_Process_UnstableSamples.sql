CREATE TABLE [data].[Cluster_Machine_Process_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativePrivilegedTime] [bigint] NULL,
[_CumulativeUserTime] [bigint] NULL,
[_PrivateBytes] [bigint] NULL,
[_VirtualBytes] [bigint] NULL,
[_WorkingSet] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Process_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Process_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Process_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Process_UnstableSamples_Cluster_Machine_Process_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Process_Keys] ([Id]) ON DELETE CASCADE
GO
