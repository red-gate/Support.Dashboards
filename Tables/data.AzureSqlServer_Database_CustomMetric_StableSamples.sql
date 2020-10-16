CREATE TABLE [data].[AzureSqlServer_Database_CustomMetric_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ErrorMessage] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_CustomMetric_StableSamples] ADD CONSTRAINT [AzureSqlServer_Database_CustomMetric_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_CustomMetric_StableSamples] ADD CONSTRAINT [AzureSqlServer_Database_CustomMetric_StableSamples_AzureSqlServer_Database_CustomMetric_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_CustomMetric_Keys] ([Id]) ON DELETE CASCADE
GO
