## Get lyrics from songs listned to in study one

library(genius)
library(readr)

s1lyricget <- read_csv(here::here("data", "MusicEmotionRegulation_November17_Prolifc_Processed.csv")) %>%
  select(track_uri, artist_name, track_name) %>%
  genius::add_genius(artist = artist_name,
                     title = track_name,
                     type = "lyrics")
write_csv(s1lyricget, here::here("data", "MusicEmotionRegulation_November17_Prolifc_Lyrics.csv"))
