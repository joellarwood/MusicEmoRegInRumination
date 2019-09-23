s2qualtrics <- read_csv("/data/QualtricsRAW.csv") %>% 
  dplyr::filter(Finished == 1) %>%
  naniar::replace_with_na(replace = list(ProlificID =c("-99", "test"))) %>% # recode variables where I was testing study
  tidyr::drop_na(ProlificID) %>% 
  naniar::replace_with_na_all(condition = ~.x == -99) %>% 
  dplyr::distinct(ProlificID, .keep_all = TRUE) 

vis_dat(s2qualtrics)

spotify2 <- read_csv("../data/s2_clean.csv") %>% 
  dplyr::select(track_name:key_mode, ResponseId, ProlificID, Finished) %>% 
  naniar::replace_with_na(replace = list(ProlificID =c("-99", "test"))) %>% # recode variables where I was testing study
  tidyr::drop_na(ProlificID) %>% 
  dplyr::filter(Finished == 1) %>% 
  tidyr::drop_na(ResponseId) %>% 
  dplyr::distinct(ProlificID, .keep_all = TRUE) 