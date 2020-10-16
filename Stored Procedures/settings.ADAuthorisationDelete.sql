SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [settings].[ADAuthorisationDelete]
    @principalId INT
AS
    BEGIN
        SET NOCOUNT ON;

        BEGIN TRANSACTION
        BEGIN

			DELETE FROM [settings].[ActiveDirectoryPrincipalAuthorisation]
			 WHERE ActiveDirectoryPrincipalId = @principalId;

        END
        COMMIT TRANSACTION
    END;
GO
