--Write a query to delete all companions who didn't appear on an episode.
DELETE FROM tblCompanion 
WHERE CompanionId NOT IN 
(SELECT DISTINCT CompanionID FROM tblEpisodeCompanion);
