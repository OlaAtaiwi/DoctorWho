--Create a function called fnEnemies to printout the enemies names for a given episode
DROP FUNCTION IF EXISTS fnEnemiesNamesList
GO
DROP FUNCTION IF EXISTS fnEnemies
GO
CREATE FUNCTION fnEnemiesNamesList (@EpsoidId INT)
RETURNS TABLE AS
RETURN
	SELECT EnemyName
	FROM tblEpisodeEnemy e JOIN tblEnemy c ON(e.EnemyId=c.EnemyId)
	WHERE e.EpisodeId = @EpsoidId
GO


CREATE FUNCTION fnEnemies (@EpisodeId INT)
RETURNS VARCHAR(MAX) AS
BEGIN 
	DECLARE @Result AS VARCHAR(MAX)
	DECLARE @NamesTable TABLE(
	EnemyName VARCHAR(400)
	);
	insert into @NamesTable 
	SELECT * FROM fnEnemiesNamesList(@EpisodeId)
	SELECT @Result=STRING_AGG (EnemyName,',') 
	FROM @NamesTable;

	RETURN @Result

END;

GO


select dbo.fnEnemies(1);