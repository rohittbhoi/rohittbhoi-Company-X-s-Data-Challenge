import pandas as pd

# Read the CSV file into a DataFrame
data = pd.read_csv('music_library.csv')
print(data.head())

def filter_by_genre(df, genre):
    return df[df['genre'] == genre]

def filter_by_year(df, year):
    return df[df['release_year'] == year]

def average_duration_by_genre(df, genre):
    genre_songs = df[df['genre'] == genre]
    return genre_songs['duration'].mean()

def most_frequent_release_year(df, artist):
    artist_songs = df[df['artist'] == artist]
    return artist_songs['release_year'].mode()[0]

def unique_genres(df):
    return df['genre'].unique()

def group_by_artist(df):
    return df.groupby('artist')

# Example usage
rock_songs = filter_by_genre(data, 'Rock')
songs_2020 = filter_by_year(data, 2020)
avg_duration_rock = average_duration_by_genre(data, 'Rock')
freq_year_artist = most_frequent_release_year(data, 'Artist Name')
genres = unique_genres(data)
songs_by_artist = group_by_artist(data)

# Print results to verify
print(rock_songs.head())
print(songs_2020.head())
print(avg_duration_rock)
print(freq_year_artist)
print(genres)
print(songs_by_artist)
