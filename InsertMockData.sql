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
    ('avatar4.jpg', 'image/jpeg', 'path/to/avatar4.jpg', 'http://example.com/path/to/avatar4.jpg');
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
    ('mack', 'Mack', 'Wayne', 'mack.wayne@example.com', 'passwordfff123', 1);
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
	('Natasha', 'Romanoff', 'Natasha Romanoff is a spy.', '1985-08-08', 'Female', 2);
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
    ('Anime Movie', 'A japanes movie.', 90000000.00, '2022-01-10', 140, 9, 1, 5);
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
	(11, 1);

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
	(1, 9, 4);
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
	(10, 10);
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
	('Sidekick', 'The assistant to the main protagonist.', 'supporting', 1);
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
	(8, 6, 6);
GO