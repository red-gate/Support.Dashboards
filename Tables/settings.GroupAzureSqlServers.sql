CREATE TABLE [settings].[GroupAzureSqlServers]
(
[GroupId] [uniqueidentifier] NOT NULL,
[AzureSqlServerId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[GroupAzureSqlServers] ADD CONSTRAINT [GroupAzureSqlServers_GroupId_ServerId] PRIMARY KEY CLUSTERED  ([GroupId], [AzureSqlServerId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[GroupAzureSqlServers] ADD CONSTRAINT [GroupAzureSqlServers_ServerId] UNIQUE NONCLUSTERED  ([AzureSqlServerId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[GroupAzureSqlServers] ADD CONSTRAINT [GroupAzureSqlServers_Group] FOREIGN KEY ([GroupId]) REFERENCES [settings].[Group] ([GroupId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [settings].[GroupAzureSqlServers] ADD CONSTRAINT [GroupAzureSqlServers_Servers] FOREIGN KEY ([AzureSqlServerId]) REFERENCES [settings].[AzureSqlServers] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
