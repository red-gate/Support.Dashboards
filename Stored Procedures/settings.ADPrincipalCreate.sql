SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [settings].[ADPrincipalCreate]
    @name NVARCHAR(MAX),
    @principalType INT,
    @principalRole INT,
    @all BIT
AS
    BEGIN
        DECLARE @id INT;
        SET NOCOUNT ON;

        BEGIN TRANSACTION;
        BEGIN
            INSERT  INTO [settings].[ActiveDirectoryPrincipal]
                    ([Name],
                     [PrincipalType],
                     [PrincipalRole],
                     [All]
                    )
            VALUES  (@name,
                     @principalType,
                     @principalRole,
                     @all
                    );

            SET @id = (SELECT   Id
                       FROM     [settings].[ActiveDirectoryPrincipal]
                       WHERE    Id = @@Identity
                      );
			
        END
        COMMIT TRANSACTION;

        RETURN @id;
    END;
GO
