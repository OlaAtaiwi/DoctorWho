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
	SET @Result=''
	DECLARE enemy_cursor CURSOR FOR SELECT * FROM fnEnemiesNamesList(@EpisodeId)
	DECLARE @EnemyName AS VARCHAR(MAX)
	OPEN enemy_cursor
	FETCH NEXT FROM enemy_cursor 
	INTO @EnemyName 
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Result= CONCAT(@Result, ', ', @EnemyName)

			FETCH NEXT FROM enemy_cursor
			INTO @EnemyName
		END

	CLOSE enemy_cursor
	DEALLOCATE enemy_cursor
	RETURN @Result

END;

GO 