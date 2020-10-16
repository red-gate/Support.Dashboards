SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [data].[AzureSqlServer_Database_TopQueries_Keys_DeleteChunk]
    @ChunkSize AS INT
AS
BEGIN TRANSACTION

DECLARE @Chunk TABLE
(
    [Id] BIGINT NOT NULL,
    PRIMARY KEY ([Id])
)

DELETE TOP (@ChunkSize) [#AzureSqlServer_Database_TopQueries_Keys]
OUTPUT deleted.[Id] INTO @Chunk
FROM [#AzureSqlServer_Database_TopQueries_Keys]

DELETE [data].[AzureSqlServer_Database_TopQueries_Keys]
FROM @Chunk c
INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] d ON c.[Id] = d.[Id]

COMMIT TRANSACTION
GO