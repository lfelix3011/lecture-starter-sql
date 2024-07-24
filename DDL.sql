CREATE DATABASE LectureBSA
GO

USE [LectureBSA]
GO

CREATE TABLE [File] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_File PRIMARY KEY,
	[FileName] VARCHAR(80) NOT NULL,
	[MimeType] VARCHAR(255) NOT NULL,
	[Key] VARCHAR(50) NOT NULL,
	[URL] VARCHAR(300) NOT NULL,
)

CREATE TABLE [User] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_User PRIMARY KEY,
	[Username] VARCHAR(30) NOT NULL,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Email] VARCHAR(60) NOT NULL,
	[Password] VARCHAR(200) NOT NULL,
	[AvatarID] INT CONSTRAINT fk_File_User FOREIGN KEY REFERENCES [File](ID),--Avatar Image
)

CREATE TABLE [Country] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Country PRIMARY KEY,
	[Name] VARCHAR(80) NOT NULL,
)

CREATE TABLE [Person] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Person PRIMARY KEY,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Biography] VARCHAR(MAX) NOT NULL,
	[BirthDate] DATETIME NOT NULL,
	[Gender] VARCHAR(20) NOT NULL, --COULD USE A CHECK OR ANOTHER TABLE
	[HomeCountryID] INT NOT NULL CONSTRAINT fk_Country_Person FOREIGN KEY REFERENCES [Country](ID),
	[ProfileID] INT CONSTRAINT fk_File_Person FOREIGN KEY REFERENCES [File](ID),--Profile Image
	[PhotoID] INT CONSTRAINT fk_File_Person FOREIGN KEY REFERENCES [File](ID),--Photo Image
)

CREATE TABLE [Person_Photos] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Person_Photos PRIMARY KEY,
	[PersonID] INT NOT NULL CONSTRAINT fk_Person_Person_Photos FOREIGN KEY REFERENCES [Person](ID),
	[PhotoID] INT CONSTRAINT fk_File_Person FOREIGN KEY REFERENCES [File](ID),--Photo Image
)
CREATE TABLE [MovieGenre] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_MovieGenre PRIMARY KEY,
	[Name] VARCHAR(20) NOT NULL,
)

CREATE TABLE [Movie] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Movie PRIMARY KEY,
	[Title] VARCHAR(30) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[Budget] DECIMAL NOT NULL,
	[ReleaseDate] DATETIME NOT NULL,
	[Duration] INT NOT NULL,
	[DirectorID] INT NOT NULL CONSTRAINT fk_Person_Movie FOREIGN KEY REFERENCES [Person](ID),--Director Table  (Not Sure if a Movie can have multiple directors)
	[CountryProducedID] INT NOT NULL CONSTRAINT fk_Country_Movie FOREIGN KEY REFERENCES [Country](ID),
	[PosterID] INT CONSTRAINT fk_File_Movie FOREIGN KEY REFERENCES [File](ID),--Poster Image
)

CREATE TABLE [Movies_Genres] ( --Evaluate if need to be a CHECK
	CONSTRAINT pk_Movies_Genres PRIMARY KEY ([GenreID], [MovieID]),
	[GenreID] INT NOT NULL CONSTRAINT fk_MovieGenre_Movies_Genres FOREIGN KEY REFERENCES [MovieGenre](ID),--Genre
	[MovieID] INT NOT NULL CONSTRAINT fk_Movie_Movies_Genres FOREIGN KEY REFERENCES [Movie](ID),--Genre
)

CREATE TABLE [FavoriteMovies] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Person_Photos PRIMARY KEY,
	[MovieID] INT NOT NULL CONSTRAINT fk_Movie_FavoriteMovies FOREIGN KEY REFERENCES [Movie](ID),
	[LikeCounter] INT NOT NULL,
)
CREATE TABLE [FavoriteMovies_User] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_FavoriteMovies_User PRIMARY KEY,
	[UserID] INT NOT NULL CONSTRAINT fk_User_FavoriteMovies FOREIGN KEY REFERENCES [User](ID),
	[FavoriteMovieID] INT NOT NULL CONSTRAINT fk_FavoriteMovies_FavoriteMovies_User FOREIGN KEY REFERENCES [FavoriteMovies](ID),
)
--CREATE TABLE [CharacterRole] ( --Evaluate if need to be a CHECK
--	[ID] INT IDENTITY(1,1) PRIMARY KEY,
--	[Name] VARCHAR(30) NOT NULL,
--	[Description] VARCHAR(MAX) NOT NULL,
--	[Role] VARCHAR(60) NOT NULL,
--)

CREATE TABLE [Character] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Character PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[Role] VARCHAR(60) NOT NULL CHECK ([Role] IN ('leading', 'supporting', 'background')),
	[MovieID] INT NOT NULL CONSTRAINT fk_Movie_Character FOREIGN KEY REFERENCES [Movie](ID),--Movie
	[ActorID] INT CONSTRAINT fk_Person_Character FOREIGN KEY REFERENCES [Person](ID),--Actor (May need another table)
)