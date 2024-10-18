library(tidyverse)

### Read all files
files <- dir(path = "Ano_sites",
             pattern = "\\.csv$",
             recursive = TRUE, full.names = TRUE)

all <- bind_rows(
  map_df(set_names(files), function(file) {
    file %>%
      set_names() %>%
      map_dfr(~ read_delim(file = file, col_types = cols(.default = "c")))
  }, .id = "file")
)

all_coords <- all |>
  select(latitude, longitude, ano_flate, ano_punkt, everything()) |>
  mutate(sp = case_when(str_detect(file, "Blåbærogtyttebær") ~ "vac",
                        str_detect(file, "Blåbær") ~ "vm",
                        str_detect(file, "Tyttebær") ~ "vv")) |>
  mutate(latitude = as.numeric(latitude),
         longitude = as.numeric(longitude),
         temperature_WQ = as.numeric(temperature_WQ),
         precipitation_Annual = as.numeric(precipitation_Annual),
         road_distance = as.numeric(road_distance),

         name = paste(str_remove(ano_punkt, "ANO"), kartleggin, sp, round(temperature_WQ, 0), round(precipitation_Annual, 0), round(road_distance, 0), sep = "_")) |>
  select(latitude:ano_punkt, hovedtype, kartleggin, sp, everything())

all_coords %>%
  write_csv(., file = "data/all_coords.csv")

all_coords |>
  select(latitude, longitude, name) %>%
  write_csv(., file = "all.csv")


all_coords |>
  select(latitude, longitude, name) |>
  filter(str_detect(name, "vm")) %>%
  write_csv(., file = "vm.csv")

all_coords |>
  select(latitude, longitude, name) |>
  filter(str_detect(name, "vac")) %>%
  write_csv(., file = "both.csv")

all_coords |>
  select(latitude, longitude, name) |>
  filter(str_detect(name, "vv")) %>%
  write_csv(., file = "vv.csv")


all_coords |>
  filter(ano_flate == "ANO0284") |>
  select(latitude, longitude, name) %>%
  write_csv(., file = "ANO0284.csv")



ano <- read_excel("raw_data/Gradient sampling 2024 - Durin.xlsx", sheet = "ANO flater", skip = 1)
points <- ano |> distinct(ano_punkt)

all_coords |>
  tidylog::inner_join(points) |>
  select(latitude, longitude, name) %>%
  write_csv(., "my_points.csv")


# northern norway coords
all_coords |>
  filter(ano_flate %in% c("ANO0239", "ANO1179", "ANO0135", "ANO0075", "ANO0475",
                          "ANO0971", "ANO0284", "ANO0827", "ANO0970", "ANO0460",
                          "ANO0747", "ANO0969", "ANO0808", "ANO0622", "ANO0436",
                          "ANO0291", "ANO0980", "ANO0718", "ANO0946", "ANO1259",

                          "ANO0256", "ANO0512", "ANO0508", "ANO0992", "ANO0276",
                          "ANO1468", "ANO1485", "ANO1535", "ANO1486", "ANO1544",
                          "ANO1476", "ANO1088", "ANO0621", "ANO0655", "ANO0435",
                          "ANO0104", "ANO0004", "ANO0580", "ANO0801", "ANO0833",
                          "ANO0517", "ANO1500", "ANO1364", "ANO0786", "ANO1195",

                          "ANO0457", "ANO0472", "ANO0880")) |>
  select(latitude, longitude, name) %>%
  write_csv(., "my_points.csv")
