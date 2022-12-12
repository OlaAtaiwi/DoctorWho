INSERT INTO tblEnemy (EnemyName,Description) VALUES
('Hisoka','Hunter'),
('Queen Grimhilde','Snow White and the Seven Dwarfs'),
('Lady Tremaine','Cinderella'),
('Scar','The lion is the king of the jungle'),
('Ursula','the little Mermaid');
GO

INSERT INTO tblAuthor (AuthorName) VALUES 
('Gosho Aoyama'),
('Rudyard Kipling'),
('Kozu Kozuha'),
('Guy Ritchie'),
('Akira Kurosawa'),
('Stanley Kubrick');
GO

INSERT INTO tblDoctor (DoctorNumber,DoctorName,BirthDate,FirstEpisodeDate,LastEpisodeDate)VALUES
(1, 'William', CAST('1908-01-08' AS Date), CAST('1963-10-29' AS DATE), CAST('1966-10-29' AS DATE)),
(2, 'Patrick', CAST('1920-03-25' AS Date), CAST('1966-11-05' AS DATE), CAST('1969-06-21' AS DATE)),
(3, 'Jon', CAST('1919-07-07' AS Date), CAST('1970-01-02' AS DATE), CAST('1974-06-08' AS DATE)),
(4, 'Tom', CAST('1934-01-20' AS Date), CAST('1974-12-28' AS DATE), CAST('1981-03-21' AS DATE)),
(5, 'Peter', CAST('1951-04-13' AS Date), CAST('1982-01-04' AS DATE), CAST('1984-03-16' AS DATE)),
(6, 'Colin', CAST('1943-06-08' AS Date), CAST('1984-03-22' AS DATE), CAST('1986-12-06' AS DATE)),
(7, 'Sylvester', CAST('1943-08-20' AS Date), CAST('1987-09-07' AS DATE), CAST('1989-12-06' AS DATE));
GO

INSERT INTO tblCompanion(CompanionName,WhoPlayed) VALUES
('Polly','Anneke Wills'),
('Zoe Heriot','Wendy Padbury'),
('Nyssa','Sarah Sutton'),
('Mickey Smith','Noel Clarke'),
('Nardole','Matt Lucas');
GO

INSERT INTO tblEpisode(SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes) VALUES
(1,1,'Classic','The Heirs of the Dragon',CAST('2002-10-29' AS DATE),4,2,''),
(1,2,'Classic','The Rogue Prince',CAST('2002-10-30' AS DATE),4,2,''),
(1,3,'Classic','Second of His Name',CAST('2002-11-01' AS DATE),4,1,''),
(1,4,'Classic','King of the Narrow Sea',CAST('2002-11-02' AS DATE),4,1,''),
(2,1,'Classic','We Light the Way',CAST('2002-12-01' AS DATE),5,3,''),
(2,2,'Classic','The Princess and the Queen',CAST('2002-12-02' AS DATE),5,2,''),
(2,3,'Classic','The Princess and the Queen',CAST('2002-12-03' AS DATE),5,4,'');
GO

INSERT INTO tblEpisodeEnemy(EpisodeId,EnemyID) VALUES
(1,2),
(1,3),
(2,2),
(2,4),
(2,5),
(3,1),
(4,2),
(4,3);
GO

INSERT INTO tblEpisodeCompanion(EpisodeId, CompanionId) VALUES
(1,5),
(2,4),
(3,1),
(4,3),
(5,2);
GO