CREATE TABLE [settings].[CustomMetricSqlServers]
(
[CustomMetricId] [bigint] NOT NULL,
[SqlServerId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetricSqlServers] ADD CONSTRAINT [CustomMetricSqlServers_CustomMetricId_SqlServerId] PRIMARY KEY CLUSTERED  ([CustomMetricId], [SqlServerId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CustomMetricSqlServers_SqlServerId] ON [settings].[CustomMetricSqlServers] ([SqlServerId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetricSqlServers] ADD CONSTRAINT [CustomMetricSqlServers_CustomMetrics] FOREIGN KEY ([CustomMetricId]) REFERENCES [settings].[CustomMetrics] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [settings].[CustomMetricSqlServers] ADD CONSTRAINT [CustomMetricSqlServers_SqlServers] FOREIGN KEY ([SqlServerId]) REFERENCES [settings].[SqlServers] ([Id]) ON DELETE CASCADE
GO
