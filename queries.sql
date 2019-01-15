-- Query all of the entries in the Genre table
SELECT * FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into Artist(ArtistName, YearEstablished)
values("Rainbow Kitten Surprise", 2016)

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into Album
SELECT null, "RKS", "2015", 345, "Cats", artist.ArtistId, genre.GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Rainbow Kitten Surprise"
AND Genre.label  = "Rock"

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into Song
SELECT null, "Devil Like Me", 315, "2015", genre.GenreId, artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Artist.ArtistName = "Rainbow Kitten Surprise"
AND Genre.label  = "Rock"
AND Album.Title = "RKS"

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT Artist.artistName, al.Title, sg.Title
FROM Artist
LEFT Join Album al ON al.artistId = artist.artistId --left didnt really change much for me
LEFT JOIN Song sg ON sg.artistID = artist.artistId
WHERE ArtistName LIKE "Rainbow Kitten Surprise" --"Rainbow%"

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT count(songId) as song_count, Album.Title
from Song, Album
WHERE song.AlbumId = Album.AlbumId
GROUP BY ALbum.Title

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT count(songId) as song_count, artist.artistname
from Song, Artist
WHERE song.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistName

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT count(songId) as song_count, Genre.Label
from Song, Genre
WHERE song.GenreId = Genre.GenreId
GROUP BY Genre.Label


-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT Album.Title, Max(Album.AlbumLength) as The_Longest_of_Long
FROM Album

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Song.Title, Max(Song.SongLength) as The_Longest_of_Long
FROM Song

-- Modify the previous query to also display the title of the album.

SELECT Song.Title, album.title , Max(Song.SongLength) as The_Longest_of_Long
FROM Song, Album
WHERE Song.AlbumId = Album.AlbumId