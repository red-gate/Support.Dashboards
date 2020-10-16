CREATE TABLE [settings].[ActiveDirectoryPrincipalAuthorisation]
(
[AuthorisationId] [int] NOT NULL IDENTITY(1, 1),
[ActiveDirectoryPrincipalId] [int] NOT NULL,
[GroupId] [uniqueidentifier] NULL,
[ClusterId] [uniqueidentifier] NULL,
[AzureSqlServerId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipalAuthorisation] ADD CONSTRAINT [ActiveDirectoryPrincipalAuthorisation_PK] PRIMARY KEY CLUSTERED  ([AuthorisationId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipalAuthorisation] ADD CONSTRAINT [ActiveDirectoryPrincipalAuthorisation_Uniqueness] UNIQUE NONCLUSTERED  ([ActiveDirectoryPrincipalId], [GroupId], [ClusterId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipalAuthorisation] ADD CONSTRAINT [FK__ActiveDir__Activ__1CBC4616] FOREIGN KEY ([ActiveDirectoryPrincipalId]) REFERENCES [settings].[ActiveDirectoryPrincipal] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipalAuthorisation] ADD CONSTRAINT [FK__ActiveDir__Azure__1DB06A4E] FOREIGN KEY ([AzureSqlServerId]) REFERENCES [settings].[AzureSqlServers] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipalAuthorisation] ADD CONSTRAINT [FK__ActiveDir__Clust__1DB06A4F] FOREIGN KEY ([ClusterId]) REFERENCES [settings].[Clusters] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipalAuthorisation] ADD CONSTRAINT [FK__ActiveDir__Group__1EA48E88] FOREIGN KEY ([GroupId]) REFERENCES [settings].[Group] ([GroupId]) ON DELETE CASCADE
GO
