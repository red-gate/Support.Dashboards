CREATE TABLE [settings].[SnmpSettings]
(
[Id] [int] NOT NULL,
[Enable] [bit] NOT NULL,
[AlertOnEnded] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[SnmpSettings] ADD CONSTRAINT [SnmpSettings_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
