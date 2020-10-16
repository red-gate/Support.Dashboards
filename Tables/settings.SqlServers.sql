CREATE TABLE [settings].[SqlServers]
(
[Id] [uniqueidentifier] NOT NULL,
[CreatedDate] [bigint] NOT NULL,
[ModifiedDate] [bigint] NOT NULL,
[IsValid] [bit] NOT NULL,
[IsSuspended] [bit] NOT NULL,
[CredentialsDiscriminator] [int] NOT NULL,
[User] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[Domain] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[Password] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[ParentId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Address] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[IsTraceEnabled] [bit] NOT NULL,
[Port] [int] NULL,
[NetworkLibrary] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[PacketSize] [int] NULL,
[ConnectionTimeout] [int] NULL,
[ExecutionTimeout] [int] NULL,
[Encrypt] [bit] NOT NULL,
[MW_IsEnabled] [bit] NOT NULL,
[MW_Start] [bigint] NULL,
[MW_Duration] [bigint] NULL,
[MW_Monday] [bit] NOT NULL,
[MW_Tuesday] [bit] NOT NULL,
[MW_Wednesday] [bit] NOT NULL,
[MW_Thursday] [bit] NOT NULL,
[MW_Friday] [bit] NOT NULL,
[MW_Saturday] [bit] NOT NULL,
[MW_Sunday] [bit] NOT NULL,
[Alias] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[SqlServers] ADD CONSTRAINT [SqlServers_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [settings].[SqlServers] ADD CONSTRAINT [SqlServers_ParentId_Name] UNIQUE NONCLUSTERED  ([ParentId], [Name]) ON [PRIMARY]
GO
ALTER TABLE [settings].[SqlServers] ADD CONSTRAINT [SqlServers_Clusters] FOREIGN KEY ([ParentId]) REFERENCES [settings].[Clusters] ([Id]) ON DELETE CASCADE
GO
