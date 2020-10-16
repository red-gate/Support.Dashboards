CREATE TABLE [settings].[Clusters]
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
[Name] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[IsCluster] [bit] NOT NULL,
[IsAddressDetected] [bit] NOT NULL,
[NodeCount] [int] NOT NULL,
[RequestedLicenceLevel] [int] NOT NULL,
[EffectiveLicenceLevel] [int] NOT NULL,
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
[IsFixedClusterName] [bit] NOT NULL CONSTRAINT [Clusters_df_IsFixedClusterName] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [settings].[Clusters] ADD CONSTRAINT [Clusters_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [settings].[Clusters] ADD CONSTRAINT [Clusters_Name] UNIQUE NONCLUSTERED  ([Name]) ON [PRIMARY]
GO
