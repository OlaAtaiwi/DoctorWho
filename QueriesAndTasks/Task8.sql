--Create a SQL view called **`viewEpisodes`** to list out all episodes, include:
--Author Name
--Doctor Name
--Companions
--Enemies


DROP VIEW IF EXISTS viewEpisodes
GO
CREATE VIEW viewEpisodes AS
SELECT a.AuthorName,d.DoctorName, dbo.fnCompanions(e.EpisodeId) AS Companions, dbo.fnEnemies(e.EpisodeId) AS Enemies
FROM tblEpisode e LEFT JOIN tblAuthor a ON(e.AuthorID=a.AuthorId)
LEFT JOIN tblDoctor d ON(e.DoctorId=d.DoctorId);
GO


select * from viewEpisodes;