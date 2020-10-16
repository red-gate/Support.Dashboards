CREATE TABLE [settings].[CustomMetricAzureSqlServers]
(
[CustomMetricId] [bigint] NOT NULL,
[AzureSqlServerId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetricAzureSqlServers] ADD CONSTRAINT [CustomMetricAzureSqlServers_CustomMetricId_SqlServerId] PRIMARY KEY CLUSTERED  ([CustomMetricId], [AzureSqlServerId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CustomMetricAzureSqlServers_SqlServerId] ON [settings].[CustomMetricAzureSqlServers] ([AzureSqlServerId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetricAzureSqlServers] ADD CONSTRAINT [CustomMetricAzureSqlServers_CustomMetrics] FOREIGN KEY ([CustomMetricId]) REFERENCES [settings].[CustomMetrics] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [settings].[CustomMetricAzureSqlServers] ADD CONSTRAINT [CustomMetricAzureSqlServers_SqlServers] FOREIGN KEY ([AzureSqlServerId]) REFERENCES [settings].[AzureSqlServers] ([Id]) ON DELETE CASCADE
GO
