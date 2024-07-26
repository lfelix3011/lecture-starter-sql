USE [LectureBSA]
GO

-- Insert Files
INSERT INTO [File] ([FileName], [MIMEType], [Key], [URL])
VALUES 
	('avatar1.jpg', 'image/jpeg', 'path/to/avatar1.jpg', 'http://example.com/path/to/avatar1.jpg'),
	('avatar2.jpg', 'image/jpeg', 'path/to/avatar2.jpg', 'http://example.com/path/to/avatar2.jpg'),
	('poster1.jpg', 'image/jpeg', 'path/to/poster1.jpg', 'http://example.com/path/to/poster1.jpg'),
	('photo1.jpg', 'image/jpeg', 'path/to/photo1.jpg', 'http://example.com/path/to/photo1.jpg'),
	('photo2.jpg', 'image/jpeg', 'path/to/photo2.jpg', 'http://example.com/path/to/photo2.jpg'),
	('poster2.jpg', 'image/jpeg', 'path/to/poster2.jpg', 'http://example.com/path/to/poster2.jpg'),
	('avatar3.jpg', 'image/jpeg', 'path/to/avatar3.jpg', 'http://example.com/path/to/avatar3.jpg'),
	('photo3.jpg', 'image/jpeg', 'path/to/photo3.jpg', 'http://example.com/path/to/photo3.jpg'),
	('poster3.jpg', 'image/jpeg', 'path/to/poster3.jpg', 'http://example.com/path/to/poster3.jpg'),
	('avatar4.jpg', 'image/jpeg', 'path/to/avatar4.jpg', 'http://example.com/path/to/avatar4.jpg'),
	('avatar5.jpg', 'image/jpeg', 'path/to/avatar5.jpg', 'http://example.com/path/to/avatar5.jpg'),
	('avatar6.jpg', 'image/jpeg', 'path/to/avatar6.jpg', 'http://example.com/path/to/avatar6.jpg'),
	('poster4.jpg', 'image/jpeg', 'path/to/poster4.jpg', 'http://example.com/path/to/poster4.jpg'),
	('photo4.jpg', 'image/jpeg', 'path/to/photo4.jpg', 'http://example.com/path/to/photo4.jpg'),
	('photo5.jpg', 'image/jpeg', 'path/to/photo5.jpg', 'http://example.com/path/to/photo5.jpg'),
	('poster5.jpg', 'image/jpeg', 'path/to/poster5.jpg', 'http://example.com/path/to/poster5.jpg'),
	('avatar7.jpg', 'image/jpeg', 'path/to/avatar7.jpg', 'http://example.com/path/to/avatar7.jpg'),
	('photo6.jpg', 'image/jpeg', 'path/to/photo6.jpg', 'http://example.com/path/to/photo6.jpg'),
	('poster6.jpg', 'image/jpeg', 'path/to/poster6.jpg', 'http://example.com/path/to/poster6.jpg'),
	('avatar8.jpg', 'image/jpeg', 'path/to/avatar8.jpg', 'http://example.com/path/to/avatar8.jpg');
GO

-- Insert Users
INSERT INTO [User] ([Username], [FirstName], [LastName], [Email], [Password], [AvatarID])
VALUES 
	('johndoe', 'John', 'Doe', 'john.doe@example.com', 'password123', 1),
	('janedoe', 'Jane', 'Doe', 'jane.doe@example.com', 'password456', 2),  
	('juanperez', 'Juan', 'Perez', 'juan.perez@example.com', 'password789', NULL),
	('annasmith', 'Anna', 'Smith', 'anna.smith@example.com', 'password321', 3),
	('peterpan', 'Peter', 'Pan', 'peter.pan@example.com', 'password654', NULL),
	('michaeljackson', 'Michael', 'Jackson', 'michael.jackson@example.com', 'password987', 4),
	('brucewayne', 'Bruce', 'Wayne', 'bruce.wayne@example.com', 'password741', 5),
	('clarkkent', 'Clark', 'Kent', 'clark.kent@example.com', 'password852', NULL),
	('dianaprince', 'Diana', 'Prince', 'diana.prince@example.com', 'password963', 6),
	('steverogers', 'Steve', 'Rogers', 'steve.rogers@example.com', 'password159', NULL),
	('mack', 'Mack', 'Wayne', 'mack.wayne@example.com', 'passwordfff123', 1),
	('sarahconnor', 'Sarah', 'Connor', 'sarah.connor@example.com', 'password741', 7),
	('johnconnor', 'John', 'Connor', 'john.connor@example.com', 'password852', 8),
	('tonystark', 'Tony', 'Stark', 'tony.stark@example.com', 'password963', 9),
	('brucebanner', 'Bruce', 'Banner', 'bruce.banner@example.com', 'password159', 10),
	('natasharomanoff', 'Natasha', 'Romanoff', 'natasha.romanoff@example.com', 'password753', 3),
	('stevenstrange', 'Steven', 'Strange', 'steven.strange@example.com', 'password456', 4),
	('thorodinson', 'Thor', 'Odinson', 'thor.odinson@example.com', 'password789', 5),
	('peterparker', 'Peter', 'Parker', 'peter.parker@example.com', 'password123', 6),
	('clintbarton', 'Clint', 'Barton', 'clint.barton@example.com', 'password789', NULL);
GO

-- Insert Countries
INSERT INTO [Country] ([Name])
VALUES
	('USA'),
	('UK'),
	('Canada');
GO

-- Insert Persons
INSERT INTO [Person] ([FirstName], [LastName], [Biography], [BirthDate], [Gender], [HomeCountryID])
VALUES
	('Max', 'Doe', 'Max Doe is an actor known for his roles in action films.', '1985-06-15', 'Male', 1),
	('Maria', 'Smith', 'Maria Smith is a director and actress known for her work in drama.', '1979-11-23', 'Female', 2),
	('John', 'Doe', 'John Doe is a producer.', '1980-01-01', 'Male', 1),
	('Anna', 'Lee', 'Anna Lee is a writer.', '1990-02-02', 'Female', 3),
	('Bruce', 'Wayne', 'Bruce Wayne is a philanthropist.', '1975-03-03', 'Male', 1),
	('Diana', 'Prince', 'Diana Prince is an ambassador.', '1985-04-04', 'Female', 2),
	('Clark', 'Kent', 'Clark Kent is a journalist.', '1980-05-05', 'Male', 1),
	('Peter', 'Parker', 'Peter Parker is a photographer.', '1995-06-06', 'Male', 3),
	('Tony', 'Stark', 'Tony Stark is an engineer.', '1970-07-07', 'Male', 1),
	('Natasha', 'Romanoff', 'Natasha Romanoff is a spy.', '1985-08-08', 'Female', 2),
	('Samuel', 'L. Jackson', 'An actor known for various roles.', '1948-12-21', 'Male', 1),
	('Robert', 'Downey Jr.', 'An actor known for his role as Iron Man.', '1965-04-04', 'Male', 1),
	('Chris', 'Hemsworth', 'An actor known for his role as Thor.', '1983-08-11', 'Male', 2),
	('Scarlett', 'Johansson', 'An actress known for her role as Black Widow.', '1984-11-22', 'Female', 1),
	('Chris', 'Evans', 'An actor known for his role as Captain America.', '1981-06-13', 'Male', 1),
	('Mark', 'Ruffalo', 'An actor known for his role as Hulk.', '1967-11-22', 'Male', 1),
	('Jeremy', 'Renner', 'An actor known for his role as Hawkeye.', '1971-01-07', 'Male', 1),
	('Benedict', 'Cumberbatch', 'An actor known for his role as Doctor Strange.', '1976-07-19', 'Male', 2),
	('Tom', 'Holland', 'An actor known for his role as Spider-Man.', '1996-06-01', 'Male', 3),
	('Chris', 'Pratt', 'An actor known for his role as Star-Lord.', '1979-06-21', 'Male', 1);
GO

-- Insert Movies
INSERT INTO [Movie] ([Title], [Description], [Budget], [ReleaseDate], [Duration], [DirectorID], [CountryProducedID], [PosterID])
VALUES 
	('Movie Title 1', 'A detailed description of Movie Title 1.', 15000000.00, '2024-01-01', 135, 2, 1, 3),
	('Drama Movie', 'A heartfelt drama about family and relationships.', 80000000.00, '2023-03-10', 120, 2, 2, 4),
	('Action Movie', 'An epic action movie with thrilling sequences.', 150000000.00, '2023-05-15', 135, 1, 1, 3),
	('Comedy Movie', 'A hilarious comedy movie.', 50000000.00, '2023-06-20', 110, 3, 2, NULL),
	('Horror Movie', 'A spine-chilling horror movie.', 20000000.00, '2023-07-30', 100, 4, 1, 2),
	('Sci-Fi Movie', 'A science fiction adventure.', 120000000.00, '2018-09-10', 140, 5, 3, NULL),
	('Romantic Movie', 'A touching romantic movie.', 30000000.00, '2023-10-15', 115, 6, 1, 1),
	('Thriller Movie', 'A gripping thriller movie.', 60000000.00, '2023-11-20', 130, 7, 2, NULL),
	('Documentary Movie', 'An informative documentary.', 10000000.00, '2016-12-25', 90, 8, 3, NULL),
	('Animated Movie', 'A fun animated movie for all ages.', 70000000.00, '2024-01-10', 95, 9, 1, 5),
	('Anime Movie', 'A Japanese movie.', 90000000.00, '2022-01-10', 140, 9, 1, 5),
	('Fantasy Movie', 'A magical fantasy adventure.', 110000000.00, '2021-04-15', 130, 1, 1, 6),
	('Historical Movie', 'A historical drama.', 40000000.00, '2020-07-18', 125, 2, 2, 7),
	('Mystery Movie', 'A mysterious thriller.', 50000000.00, '2023-02-05', 115, 3, 3, 8),
	('Western Movie', 'A classic western film.', 60000000.00, '2019-11-22', 110, 4, 1, 9),
	('Adventure Movie', 'An epic adventure movie.', 100000000.00, '2024-03-01', 135, 5, 1, 10),
	('Horror Movie 2', 'Another spine-chilling horror movie.', 25000000.00, '2023-09-30', 100, 6, 2, NULL),
	('Drama Movie 2', 'A sequel to the heartfelt drama.', 85000000.00, '2023-12-10', 120, 7, 1, NULL),
	('Romantic Movie 2', 'A sequel to the romantic movie.', 35000000.00, '2023-11-25', 115, 8, 2, NULL),
	('Animated Movie 2', 'A sequel to the fun animated movie.', 75000000.00, '2024-02-15', 95, 9, 1, NULL);
GO

-- Insert Genres
INSERT INTO [Genre] ([Name])
VALUES
	('Action'),
	('Drama'),
	('Comedy'),
	('Horror'),
	('Sci-Fi'),
	('Romantic'),
	('Thriller'),
	('Documentary'),
	('Animated');
GO

-- Insert MovieGenres
INSERT INTO [MovieGenre] ([MovieID], [GenreID])
VALUES
	(1, 1),
	(2, 2),
	(3, 1),
	(4, 3),
	(5, 4),
	(6, 5),
	(7, 6),
	(8, 7),
	(9, 8),
	(10, 9),
	(11, 1),
	(12, 9),
	(13, 2),
	(14, 7),
	(15, 3),
	(16, 1),
	(17, 4),
	(18, 2),
	(19, 6),
	(20, 9);
GO

-- Insert PersonPhotos
INSERT INTO [PersonPhoto] ([IsProfile], [PersonID], [PhotoID])
VALUES
	(1, 1, 1),
	(0, 1, 5),
	(1, 2, 2),
	(0, 3, 3),
	(1, 4, 4),
	(1, 5, 6),
	(0, 6, 1),
	(0, 7, 2),
	(1, 8, 3),
	(1, 9, 4),
	(0, 9, 2),
	(1, 10, 1),
	(0, 11, 5),
	(1, 12, 2),
	(0, 13, 3),
	(1, 14, 4),
	(0, 15, 6),
	(1, 16, 7),
	(0, 17, 8),
	(1, 18, 9),
	(0, 19, 10);
GO

-- Insert FavoriteMovies
INSERT INTO [FavoriteMovies] ([MovieID], [UserID])
VALUES
	(1, 1),
	(2, 1),
	(1, 2),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20);
GO

-- Insert Characters
INSERT INTO [Character] ([Name], [Description], [Role], [MovieID])
VALUES
	('Hero', 'The main protagonist of the action movie.', 'leading', 1),
	('Villain', 'The antagonist in the action movie.', 'supporting', 1),
	('Comedian', 'The funny character in the comedy movie.', 'leading', 4),
	('Ghost', 'The spooky entity in the horror movie.', 'leading', 5),
	('Scientist', 'The genius in the sci-fi movie.', 'leading', 6),
	('Lover', 'The romantic interest in the romantic movie.', 'leading', 7),
	('Detective', 'The main investigator in the thriller movie.', 'leading', 8),
	('Narrator', 'The voice guiding through the documentary.', 'leading', 9),
	('Heroine', 'The main character in the animated movie.', 'leading', 10),
	('Sidekick', 'The assistant to the main protagonist.', 'supporting', 1),
	('Fantasy Hero', 'The main protagonist of the fantasy movie.', 'leading', 12),
	('King', 'The ruler in the historical movie.', 'leading', 13),
	('Detective 2', 'The main investigator in the mystery movie.', 'leading', 14),
	('Cowboy', 'The hero in the western movie.', 'leading', 15),
	('Explorer', 'The adventurer in the adventure movie.', 'leading', 16),
	('Ghost 2', 'Another spooky entity in the horror movie.', 'supporting', 17),
	('Dramatic Lead', 'The main character in the drama movie.', 'leading', 18),
	('Lover 2', 'The romantic interest in the romantic movie.', 'leading', 19),
	('Animated Hero 2', 'The main character in the animated movie.', 'leading', 20);
GO

-- Insert MovieActors
INSERT INTO [MovieActor] ([MovieID], [ActorID], [CharacterID])
VALUES
	(1, 1, 1),
	(1, 2, NULL),
	(4, 3, 3),
	(5, 4, NULL),
	(6, 5, 5),
	(7, 6, 6),
	(8, 7, 7),
	(9, 8, NULL),
	(10, 9, 9),
	(3, 10, 10),
	(2, 5, 5),
	(8, 6, 6),
	(12, 11, 1),
	(13, 12, 2),
	(14, 13, 3),
	(15, 14, 4),
	(16, 15, 5),
	(17, 16, 6),
	(18, 17, 7),
	(19, 18, 8),
	(20, 19, 9),
	(20, 20, 10);
GO
