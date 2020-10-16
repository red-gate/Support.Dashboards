CREATE TABLE [data].[Cluster_Machine_Processors_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_AverageQueueLength] [float] NULL,
[_CumulativeAverageContextSwitches] [bigint] NULL,
[_CumulativeDpcTime] [bigint] NULL,
[_CumulativeIdleTime] [bigint] NULL,
[_CumulativeInterruptTime] [bigint] NULL,
[_CumulativePrivilegedTime] [bigint] NULL,
[_CumulativeUserTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Processors_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Processors_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Processors_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Processors_UnstableSamples_Cluster_Machine_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Keys] ([Id]) ON DELETE CASCADE
GO
