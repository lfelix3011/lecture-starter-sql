USE [LectureBSA]
GO

-- Insert Files
INSERT INTO [File] ([FileName], [MIMEType], [Key], [URL])
VALUES 
    ('avatar1.jpg', 'image/jpeg', 'path/to/avatar1.jpg', 'http://example.com/path/to/avatar1.jpg'),
    ('avatar2.jpg', 'image/jpeg', 'path/to/avatar2.jpg', 'http://example.com/path/to/avatar2.jpg'),
    ('poster1.jpg', 'image/jpeg', 'path/to/poster1.jpg', 'http://example.com/path/to/poster1.jpg'),
    ('photo1.jpg', 'image/jpeg', 'path/to/photo1.jpg', 'http://example.com/path/to/photo1.jpg'),
    ('photo2.jpg', 'image/jpeg', 'path/to/photo2.jpg', 'http://example.com/path/to/photo2.jpg');

GO

-- Insert Users
INSERT INTO [User] ([Username], [FirstName], [LastName], [Email], [Password], [AvatarID])
VALUES 
    ('johndoe', 'John', 'Doe', 'john.doe@example.com', 'password123', 1),
    ('janedoe', 'Jane', 'Doe', 'jane.doe@example.com', 'password456', 2),  
	('jaunPerez', 'Juan', 'Perez', 'jaun.perez@example.com', 'password789', NULL);

GO

-- Insert Country
INSERT INTO [Country] ([Name])
VALUES
('USA'),
('UK'),
('Canada');

GO

-- Insert Persons
INSERT INTO [Person] ([FirstName], [LastName], [Biography], [BirthDate], [Gender], [HomeCountryID])
VALUES
('Max', 'Doe', 'John Doe is an actor known for his roles in action films.', '1985-06-15', 'Male', 1),
('Maria', 'Smith', 'Jane Smith is a director and actress known for her work in drama.', '1979-11-23', 'Female', 2);

GO

-- Insert Movies
INSERT INTO [Movie] ([Title], [Description], [Budget], [ReleaseDate], [Duration], [DirectorID], [CountryProducedID], [PosterID])
VALUES 
    ('Movie Title 1', 'A detailed description of Movie Title 1.', 15000000.00, '2024-01-01', 135, 2, 1, 3),
	('Drama Movie', 'A heartfelt drama about family and relationships.', 80000000.00, '2023-03-10', 120, 2, 2, 4),
	('Action Movie', 'An epic action movie with thrilling sequences.', 150000000.00, '2023-05-15', 135, 1, 1, 3);

GO

-- Insert Genre
INSERT INTO [Genre] ([Name])
VALUES
('Action'),
('Drama');

GO

-- Insert Movies Genres 
INSERT INTO [MovieGenre] ([MovieID], [GenreID])
VALUES
(1, 1),
(2, 2);

GO

-- Insert Persons Photos 
INSERT INTO [PersonPhoto] ([PersonID], [PhotoID], [IsProfile])
VALUES
(1, 1, 1),
(1, 5, 0),
(2, 2, 0);

GO

-- Insert Users Favorite Movies
INSERT INTO [FavoriteMovies] ([MovieID], [UserID])
VALUES
(1, 1),
(2, 1)

GO

-- Insert Characters
INSERT INTO [Character] ([Name], [Description], [Role], [MovieID])
VALUES
('Hero', 'The main protagonist of the action movie.', 'leading', 1),
('Villain', 'The antagonist in the action movie.', 'supporting', 1);

GO

-- Insert Movie Actors
INSERT INTO [MovieActor] ([MovieID], [ActorID], [CharacterID])
VALUES
(1, 1, 1),
(2, 2, NULL);
