CREATE TABLE [settings].[AuthTokens]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[HashSalt] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[HashedToken] [varbinary] (max) NOT NULL,
[Username] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[CreatedAtUtc] [datetime2] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[AuthTokens] ADD CONSTRAINT [PK_AuthTokens] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
