library(readr)

# Read the CSV file into a DataFrame
data <- read_csv('music_library.csv')
print(head(data))

filter_by_genre <- function(df, genre) {
  return(subset(df, genre == genre))
}

filter_by_year <- function(df, year) {
  return(subset(df, release_year == year))
}

average_duration_by_genre <- function(df, genre) {
  genre_songs <- subset(df, genre == genre)
  return(mean(genre_songs$duration))
}

most_frequent_release_year <- function(df, artist) {
  artist_songs <- subset(df, artist == artist)
  return(as.numeric(names(sort(table(artist_songs$release_year), decreasing = TRUE)[1])))
}

unique_genres <- function(df) {
  return(unique(df$genre))
}

group_by_artist <- function(df) {
  return(split(df, df$artist))
}

# Example usage
rock_songs <- filter_by_genre(data, 'Rock')
songs_2020 <- filter_by_year(data, 2020)
avg_duration_rock <- average_duration_by_genre(data, 'Rock')
freq_year_artist <- most_frequent_release_year(data, 'Artist Name')
genres <- unique_genres(data)
songs_by_artist <- group_by_artist(data)

# Print results to verify
print(head(rock_songs))
print(head(songs_2020))
print(avg_duration_rock)
print(freq_year_artist)
print(genres)
print(head(songs_by_artist))
