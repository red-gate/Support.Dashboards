CREATE TABLE [settings].[CustomMetricGroups]
(
[CustomMetricId] [bigint] NOT NULL,
[GroupId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CustomMetricGroups_CustomMetricId] ON [settings].[CustomMetricGroups] ([CustomMetricId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CustomMetricGroups_GroupId] ON [settings].[CustomMetricGroups] ([GroupId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetricGroups] ADD CONSTRAINT [CustomMetricGroups_CustomMetrics] FOREIGN KEY ([CustomMetricId]) REFERENCES [settings].[CustomMetrics] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [settings].[CustomMetricGroups] ADD CONSTRAINT [CustomMetricGroups_Groups] FOREIGN KEY ([GroupId]) REFERENCES [settings].[Group] ([GroupId]) ON DELETE CASCADE
GO
