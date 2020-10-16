SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [data].[AzureSqlServer_ElasticPool_Keys_DeleteChunk]
    @ChunkSize AS INT
AS
BEGIN TRANSACTION

DECLARE @Chunk TABLE
(
    [Id] BIGINT NOT NULL,
    PRIMARY KEY ([Id])
)

DELETE TOP (@ChunkSize) [#AzureSqlServer_ElasticPool_Keys]
OUTPUT deleted.[Id] INTO @Chunk
FROM [#AzureSqlServer_ElasticPool_Keys]

DELETE [data].[AzureSqlServer_ElasticPool_Keys]
FROM @Chunk c
INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] d ON c.[Id] = d.[Id]

COMMIT TRANSACTION
GO
