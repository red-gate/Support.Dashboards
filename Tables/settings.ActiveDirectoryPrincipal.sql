CREATE TABLE [settings].[ActiveDirectoryPrincipal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[PrincipalType] [int] NOT NULL,
[PrincipalRole] [int] NOT NULL,
[All] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipal] ADD CONSTRAINT [ActiveDirectoryPrincipal_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [settings].[ActiveDirectoryPrincipal] ADD CONSTRAINT [UQ__ActiveDi__737584F6F28BFFDA] UNIQUE NONCLUSTERED  ([Name]) ON [PRIMARY]
GO
