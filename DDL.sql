CREATE DATABASE LectureBSA
GO

USE [LectureBSA]
GO

CREATE TABLE [File] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_File PRIMARY KEY,
	[FileName] VARCHAR(80) NOT NULL,
	[MimeType] VARCHAR(50) NOT NULL,
	[Key] VARCHAR(200) NOT NULL,
	[URL] VARCHAR(300) NOT NULL,
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
);

CREATE TABLE [User] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_User PRIMARY KEY,
	[Username] VARCHAR(30) NOT NULL,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Email] VARCHAR(60) NOT NULL,
	[Password] VARCHAR(200) NOT NULL,
	[AvatarID] INT CONSTRAINT fk_File_User FOREIGN KEY REFERENCES [File](ID),--Avatar Image,
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
);

CREATE TABLE [Country] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Country PRIMARY KEY,
	[Name] VARCHAR(128) NOT NULL,
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
);

CREATE TABLE [Person] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Person PRIMARY KEY,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Biography] VARCHAR(MAX) NOT NULL,
	[BirthDate] DATETIME NOT NULL,
	[Gender] VARCHAR(15) NOT NULL CHECK ([Gender] IN ('Not known', 'Male', 'Female', 'Not applicable')),
	[Role] VARCHAR(10) NOT NULL CHECK ([Role] IN ('Director', 'Actor')),
	[HomeCountryID] INT NOT NULL CONSTRAINT fk_Country_Person FOREIGN KEY REFERENCES [Country](ID),
	[ProfileID] INT CONSTRAINT fk_File_Person FOREIGN KEY REFERENCES [File](ID),--Profile Image (NEED TO CHECK)
	[PhotoID] INT CONSTRAINT fk_File_Person FOREIGN KEY REFERENCES [File](ID),--Photo Image (NEED TO CHECK)
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE TABLE [Person_Photo] ( --(NEED TO CHECK)
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Person_Photos PRIMARY KEY,
	[PersonID] INT NOT NULL CONSTRAINT fk_Person_Person_Photos FOREIGN KEY REFERENCES [Person](ID),
	[PhotoID] INT CONSTRAINT fk_File_Person FOREIGN KEY REFERENCES [File](ID),--Photo Image
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE TABLE [Movie] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Movie PRIMARY KEY,
	[Title] VARCHAR(30) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[Budget] DECIMAL NOT NULL,
	[ReleaseDate] DATETIME NOT NULL,
	[Duration] INT NOT NULL,
	[DirectorID] INT NOT NULL CONSTRAINT fk_Person_Movie FOREIGN KEY REFERENCES [Person](ID),
	[CountryProducedID] INT NOT NULL CONSTRAINT fk_Country_Movie FOREIGN KEY REFERENCES [Country](ID),
	[PosterID] INT CONSTRAINT fk_File_Movie FOREIGN KEY REFERENCES [File](ID),--Poster Image
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE TABLE [Genre] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Genre PRIMARY KEY,
	[Name] VARCHAR(20) NOT NULL,
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE TABLE [Movie_Genre] (
	CONSTRAINT pk_Movie_Genre PRIMARY KEY ([MovieID], [GenreID]),
	[MovieID] INT NOT NULL CONSTRAINT fk_Movie_Movie_Genre FOREIGN KEY REFERENCES [Movie](ID),
	[GenreID] INT NOT NULL CONSTRAINT fk_Genre_Movie_Genre FOREIGN KEY REFERENCES [Genre](ID),
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE TABLE [FavoriteMovies] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Person_Photos PRIMARY KEY,
	[MovieID] INT NOT NULL CONSTRAINT fk_Movie_FavoriteMovies FOREIGN KEY REFERENCES [Movie](ID),
	[LikeCounter] INT NOT NULL,
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE TABLE [FavoriteMovies_User] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_FavoriteMovies_User PRIMARY KEY,
	[UserID] INT NOT NULL CONSTRAINT fk_User_FavoriteMovies FOREIGN KEY REFERENCES [User](ID),
	[FavoriteMovieID] INT NOT NULL CONSTRAINT fk_FavoriteMovies_FavoriteMovies_User FOREIGN KEY REFERENCES [FavoriteMovies](ID),
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)

CREATE TABLE [Character] (
	[ID] INT IDENTITY(1,1) CONSTRAINT pk_Character PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[Role] VARCHAR(10) NOT NULL CHECK ([Role] IN ('leading', 'supporting', 'background')),
	[MovieID] INT NOT NULL CONSTRAINT fk_Movie_Character FOREIGN KEY REFERENCES [Movie](ID),
	[ActorID] INT CONSTRAINT fk_Person_Character FOREIGN KEY REFERENCES [Person](ID),
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
)