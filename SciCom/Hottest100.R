## Hottest 100 spoitfy data from 200-2019

library(spotifyr)
library(genius)


hottest100 <- spotifyr::get_playlist_audio_features(username = "1240269959",
                                                    playlist_uri = "200SdSoE42o3PK6MkrIXnQ") %>%
  unnest(track.artists)

hottest100_lyrics <- hottest100 %>%
  select(name, track.name, track.id) %>%
  add_genius(artist = name,
             title =track.name,
             type ="lyrics")

hottest100 %>%
  select(- name,
         - track.name,
         -track.album.artists,
         -track.album.available_markets,
         -track.album.images
         ) %>%
  left_join(hottest100_lyrics, by = "track.id") %>%
  write_csv(here::here("SciCom", "Hottest100Processed.csv"))
