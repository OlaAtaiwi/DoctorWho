--Create a function called fnEnemies to printout the enemies names for a given episode

CREATE OR ALTER FUNCTION fnEnemiesNamesList (@EpsoidId INT)
RETURNS TABLE AS
RETURN
	SELECT EnemyName
	FROM tblEpisodeEnemy e JOIN tblEnemy c ON(e.EnemyId=c.EnemyId)
	WHERE e.EpisodeId = @EpsoidId
GO


CREATE OR ALTER FUNCTION fnEnemies (@EpisodeId INT)
RETURNS VARCHAR(MAX) AS
BEGIN 
	DECLARE @Result AS VARCHAR(MAX)
	SELECT @Result=STRING_AGG (EnemyName,',') 
	FROM fnEnemiesNamesList(@EpisodeId);
	RETURN @Result

END;
GO

