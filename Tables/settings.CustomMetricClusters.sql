CREATE TABLE [settings].[CustomMetricClusters]
(
[CustomMetricId] [bigint] NOT NULL,
[ClusterId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetricClusters] ADD CONSTRAINT [CustomMetricClusters_CustomMetricId_ClusterId] PRIMARY KEY CLUSTERED  ([CustomMetricId], [ClusterId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CustomMetricClusters_ClusterId] ON [settings].[CustomMetricClusters] ([ClusterId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetricClusters] ADD CONSTRAINT [CustomMetricClusters_Clusters] FOREIGN KEY ([ClusterId]) REFERENCES [settings].[Clusters] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [settings].[CustomMetricClusters] ADD CONSTRAINT [CustomMetricClusters_CustomMetrics] FOREIGN KEY ([CustomMetricId]) REFERENCES [settings].[CustomMetrics] ([Id]) ON DELETE CASCADE
GO
