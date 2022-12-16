USE DoctorWho
GO

DROP TABLE IF EXISTS tblEnemy
GO 
CREATE TABLE tblEnemy 
(
EnemyId INT NOT NULL PRIMARY KEY IDENTITY,
EnemyName VARCHAR(400) NOT NULL,
Description Text NULL
);
GO

DROP TABLE IF EXISTS tblAuthor
GO
CREATE TABLE tblAuthor 
(
AuthorId INT NOT NULL PRIMARY KEY IDENTITY,
AuthorName VARCHAR(400) NOT NULL,
);
GO

DROP TABLE IF EXISTS tblDoctor
GO
CREATE TABLE tblDoctor 
(
DoctorId INT NOT NULL PRIMARY KEY IDENTITY,
DoctorNumber INT NOT NULL,
DoctorName VARCHAR(400) NOT NULL,
BirthDate Date NULL,
FirstEpisodeDate Date NULL,
LastEpisodeDate Date NULL,
);
GO

DROP TABLE IF EXISTS tblCompanion
GO
CREATE TABLE tblCompanion
(
CompanionId INT NOT NULL PRIMARY KEY IDENTITY,
CompanionName VARCHAR(400) NOT NULL,
WhoPlayed VARCHAR(400) NOT NULL
);
GO

DROP TABLE IF EXISTS tblEpisode
GO
CREATE TABLE tblEpisode 
(
EpisodeId INT NOT NULL PRIMARY KEY IDENTITY,
SeriesNumber INT NULL,
EpisodeNumber INT NULL,
EpisodeType VARCHAR(400) NOT NULL,
Title Text NOT NULL,
EpisodeDate Date NULL,
AuthorId INT NOT NULL REFERENCES tblAuthor (AuthorId),
DoctorId INT NOT NULL REFERENCES tblDoctor(DoctorId),
Notes Text NULL
);


DROP TABLE IF EXISTS tblEpisodeCompanion
GO 
CREATE TABLE tblEpisodeCompanion 
(
EpisodeCompanionId INT NOT NULL PRIMARY KEY IDENTITY,
EpisodeID INT NOT NULL REFERENCES tblEpisode(EpisodeId),
CompanionId INT NOT NULL REFERENCES tblCompanion(CompanionId),
);
GO

DROP TABLE IF EXISTS tblEpisodeEnemy
CREATE TABLE tblEpisodeEnemy
(
EpisodeEnemyId INT NOT NULL PRIMARY KEY  IDENTITY,
EpisodeId INT NOT NULL REFERENCES tblEpisode(EpisodeId),
EnemyID INT NOT NULL REFERENCES tblEnemy(EnemyId)
);