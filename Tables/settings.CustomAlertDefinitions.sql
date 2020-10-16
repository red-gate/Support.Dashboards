CREATE TABLE [settings].[CustomAlertDefinitions]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CustomMetricId] [bigint] NOT NULL,
[Direction] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomAlertDefinitions] ADD CONSTRAINT [CustomAlertDefinitions_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomAlertDefinitions] ADD CONSTRAINT [CustomAlertDefinitions_CustomMetric] FOREIGN KEY ([CustomMetricId]) REFERENCES [settings].[CustomMetrics] ([Id])
GO
