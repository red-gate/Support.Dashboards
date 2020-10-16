SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [settings].[ADPrincipalDelete] @id INT
AS
    BEGIN
        SET NOCOUNT ON;

        BEGIN TRANSACTION;
        BEGIN
            DECLARE @currentRecordPrincipalRole INT;

            SELECT  @currentRecordPrincipalRole = [PrincipalRole]
            FROM    [settings].[ActiveDirectoryPrincipal]
            WHERE   [Id] = @id; 

            IF (@currentRecordPrincipalRole = 1)
                BEGIN
                    DECLARE @admins INT;

                    SELECT  @admins = COUNT(*)
                    FROM    [settings].[ActiveDirectoryPrincipal]
                    WHERE   [PrincipalRole] = 1; 
            
                    IF (@admins <= 1)
                        BEGIN
                            RAISERROR ('Unable to delete the last administrator.', 15, 2 )                            
                        END;
                END;

            DELETE  FROM [settings].[ActiveDirectoryPrincipal]
            WHERE   [Id] = @id;

            IF (@@ROWCOUNT != 1)
                BEGIN
                    RAISERROR ('Incorrect number of principals deleted.', 15, 3 )                    
                END
        END
        COMMIT TRANSACTION
    END
GO
