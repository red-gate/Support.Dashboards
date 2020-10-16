SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [settings].[ADPrincipalUpdate]
    @id INT,
    @name NVARCHAR(MAX),
    @principalType INT,
    @principalRole INT,
    @all BIT
AS
    BEGIN
        SET NOCOUNT ON;

        BEGIN TRANSACTION;
        BEGIN
            UPDATE  [settings].[ActiveDirectoryPrincipal]
            SET     [Name] = @name,
                    [PrincipalType] = @principalType,
                    [PrincipalRole] = @principalRole,
                    [All] = @all
            WHERE   [Id] = @id;

            IF (@@ROWCOUNT != 1)
                BEGIN
                    RAISERROR ('Incorrect number of principals updated.', 15, 1 )
                    
                END;
        END
        COMMIT TRANSACTION;
    END
GO
