--Create a function called fnCompanions to printout the companions names for a given episode
DROP FUNCTION IF EXISTS fnCompanionsNamesList
GO
DROP FUNCTION IF EXISTS fnCompanions
GO
CREATE FUNCTION fnCompanionsNamesList (@EpsoidId INT)
RETURNS TABLE AS
RETURN
	SELECT CompanionName
	FROM tblEpisodeCompanion e JOIN tblCompanion c ON(e.CompanionId=c.CompanionId)
	WHERE e.EpisodeId = @EpsoidId
GO


CREATE FUNCTION fnCompanions (@EpisodeId INT)
RETURNS VARCHAR(MAX) AS
BEGIN 
	DECLARE @Result AS VARCHAR(MAX)
	SET @Result=''
	DECLARE companion_cursor CURSOR FOR SELECT * FROM fnCompanionsNamesList(@EpisodeId)
	DECLARE @CompanionName AS VARCHAR(MAX)
	OPEN companion_cursor
	FETCH NEXT FROM companion_cursor 
	INTO @CompanionName 
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Result= CONCAT(@Result, ', ', @CompanionName)

			FETCH NEXT FROM companion_cursor
			INTO @CompanionName
		END

	CLOSE companion_cursor
	DEALLOCATE companion_cursor
	RETURN @Result

END;
