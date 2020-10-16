CREATE TABLE [settings].[KeyValuePairs]
(
[KeyName] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[KeyValue] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[KeyValueType] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[KeyValuePairs] ADD CONSTRAINT [CK_KeyValuePairValueIsValid] CHECK (([settings].[CheckKeyValuePairSetting]([KeyValue],[KeyValueType])=(1)))
GO
ALTER TABLE [settings].[KeyValuePairs] ADD CONSTRAINT [PK_KeyValuePairs] PRIMARY KEY CLUSTERED  ([KeyName]) ON [PRIMARY]
GO
