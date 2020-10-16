CREATE TABLE [data].[AzureSqlServer_Database_QueryPlans_Sightings]
(
[Id] [bigint] NOT NULL,
[SightingDate] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_QueryPlans_Sightings] ADD CONSTRAINT [AzureSqlServer_Database_QueryPlans_Sightings_SightingDate_Id] PRIMARY KEY CLUSTERED  ([SightingDate], [Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_Database_QueryPlans_Sightings_Id] ON [data].[AzureSqlServer_Database_QueryPlans_Sightings] ([Id], [SightingDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_QueryPlans_Sightings] ADD CONSTRAINT [AzureSqlServer_Database_QueryPlans_Sightings_AzureSqlServer_Database_QueryPlans_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_QueryPlans_Keys] ([Id]) ON DELETE CASCADE
GO
