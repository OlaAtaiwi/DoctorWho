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


CREATE FUNCTION fnCompanions(@EpisodeId INT)
RETURNS VARCHAR(MAX) AS
BEGIN 
	DECLARE @Result AS VARCHAR(MAX)
	SELECT @Result=STRING_AGG (CompanionName,',') 
	FROM fnCompanionsNamesList(@EpisodeId);
	RETURN @Result

END;
GO

