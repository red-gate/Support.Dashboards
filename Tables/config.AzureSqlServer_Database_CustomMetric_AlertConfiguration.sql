CREATE TABLE [config].[AzureSqlServer_Database_CustomMetric_AlertConfiguration]
(
[Id] [bigint] NOT NULL,
[_AlertType] [bigint] NOT NULL,
[_SubType] [bigint] NOT NULL CONSTRAINT [DF_AzureSqlServer_Database_CustomMetric_AlertConfiguration__SubType] DEFAULT ((0)),
[_Configuration] [xml] NOT NULL,
[_Enabled] [bit] NOT NULL,
[_AlertNotification] [bigint] NOT NULL,
[_EmailAddress] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[_Comments] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DF_AzureSqlServer_Database_CustomMetric_AlertConfiguration__Comments] DEFAULT (''),
[_Version] [bigint] NOT NULL,
[_SlackEnabled] [bit] NOT NULL CONSTRAINT [DF_AzureSqlServer_Database_CustomMetric_AlertConfiguration__SlackEnabled] DEFAULT ((1)),
[_SnmpEnabled] [bit] NOT NULL CONSTRAINT [DF_AzureSqlServer_Database_CustomMetric_AlertConfiguration__SnmpEnabled] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [config].[AzureSqlServer_Database_CustomMetric_AlertConfiguration] ADD CONSTRAINT [AzureSqlServer_Database_CustomMetric_AlertConfiguration_Id__AlertType__SubType] PRIMARY KEY CLUSTERED  ([Id], [_AlertType], [_SubType]) ON [PRIMARY]
GO
ALTER TABLE [config].[AzureSqlServer_Database_CustomMetric_AlertConfiguration] ADD CONSTRAINT [AzureSqlServer_Database_CustomMetric_AlertConfiguration_AzureSqlServer_Database_CustomMetric_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_CustomMetric_Keys] ([Id]) ON DELETE CASCADE
GO
