all_coords <- read_csv(file = "data/all_coords.csv")

meta <- all_coords |>
  select(ANO_flatID = ano_flate, ANO_pointID = ano_punkt, hovedtype, NiN_type = kartleggin, temperature_WQ, precipitation_Annual) |>
  mutate(ANO_flatID = str_remove(ANO_flatID, "ANO"),
         ANO_pointID = as.numeric(substr(ANO_pointID, nchar(ANO_pointID)-1, nchar(ANO_pointID)))) |>
  distinct()

dat <- read_csv(file = "raw_data/Durin_gradient_sampling_2024.csv")
gradient <- dat |>
  select(-habitat, -NiN_type) |>
  mutate(date = dmy(date)) |>
  fill(date, .direction = "down") |>
  fill(ANO_flatID, .direction = "down") |>
  fill(ANO_pointID, .direction = "down") |>
  fill(collector, .direction = "down") |>
  fill(collector, .direction = "down") |>
  fill(species, .direction = "down") |>
  fill(individual_nr, .direction = "down") |>
  fill(plant_height_cm, .direction = "down") |>
  fill(nr_segments_lb, .direction = "down") |>

  # fix ANO ID
  mutate(ANO_flatID = if_else(nchar(ANO_flatID) == 3, paste0("0", ANO_flatID), ANO_flatID)) |>

  # remove missing plants
  tidylog::filter(!c(ANO_flatID == "0284" & ANO_pointID == 51 & species == "vv" & individual_nr == 3)) |>
  tidylog::filter(!c(ANO_flatID == "1544" & ANO_pointID == 53 & species == "vm" & individual_nr == 2)) |>
  tidylog::left_join(meta, by = c("ANO_flatID", "ANO_pointID"))


# missing segment:
#KA_O			AH	open		vv	2


gradient |>
  distinct(ANO_flatID, ANO_pointID, species, hovedtype, individual_nr, temperature_WQ, precipitation_Annual) |>
  ggplot(aes(y = temperature_WQ, x = precipitation_Annual, colour = hovedtype)) +
  geom_jitter(width = 70, height = 0.1) +
  facet_wrap(~ species)

gradient |>
  #ggplot(aes(y = length_lb_cm, x = temperature_WQ)) +
  ggplot(aes(y = length_lb_cm, x = precipitation_Annual)) +
  geom_jitter(width = 0.1) +
  facet_wrap( ~ species)

gradient |>
  ggplot(aes(y = nr_scars, x = precipitation_Annual)) +
  #ggplot(aes(y = length_mm, x = precipitation_Annual)) +
  geom_jitter(width = 0.1) +
  facet_grid(segment ~ species)
