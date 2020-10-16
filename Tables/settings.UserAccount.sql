CREATE TABLE [settings].[UserAccount]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[UserName] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[PasswordHash] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[UserAccount] ADD CONSTRAINT [UserAccount_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [settings].[UserAccount] ADD CONSTRAINT [UserAccount_UserName] UNIQUE NONCLUSTERED  ([UserName]) ON [PRIMARY]
GO
