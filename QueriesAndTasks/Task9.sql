
DROP PROCEDURE IF EXISTS spSummariseEpisodes
GO
CREATE PROCEDURE spSummariseEpisodes AS
BEGIN
	SELECT TOP 3 c.CompanionName AS [Most Frequent Companions]
	FROM tblEpisodeCompanion e
	JOIN tblCompanion c ON e.CompanionId = c.CompanionId
	GROUP BY c.CompanionName
	ORDER BY COUNT(e.CompanionId) DESC

	SELECT TOP 3 e.EnemyName AS [Most Frequent Enemies]
	FROM tblEnemy e
	JOIN tblEpisodeEnemy ep ON e.EnemyId = ep.EnemyId
	GROUP BY e.EnemyName
	ORDER BY COUNT(ep.EnemyID) DESC
END

exec spSummariseEpisodes;
