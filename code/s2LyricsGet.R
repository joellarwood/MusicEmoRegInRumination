## Get lyrics from songs listned to in study two

library(genius)
library(readr)

s2lyricget <- read_csv(here::here("data", "MusicEmotionRegulation_November18_Prolific_Processed.csv")) %>%
  select(track_uri, artist_name, track_name) %>%
  genius::add_genius(artist = artist_name,
                     title = track_name,
                     type = "lyrics")
write_csv(s2lyricget, here::here("data", "MusicEmotionRegulation_November18_Prolific_Lyrics.csv"))
