CREATE TABLE [data].[AzureSqlServer_Database_Properties_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Collation] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_CompatibilityLevel] [bigint] NULL,
[_CreateDate] [bigint] NULL,
[_Edition] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_IsAutoCreateStatistics] [bit] NULL,
[_IsAutoShrink] [bit] NULL,
[_IsAutoUpdateStatistics] [bit] NULL,
[_IsQueryStore] [bit] NULL,
[_IsReadOnly] [bit] NULL,
[_IsSingleUser] [bit] NULL,
[_PageVerify] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ProductLevel] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ProductVersion] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[_State] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Properties_StableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Properties_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Properties_StableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Properties_StableSamples_AzureSqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
