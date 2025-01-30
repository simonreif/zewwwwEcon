# This file creates a Barchart
# - Input:  VG2500_KRS.shp
#           45412-03-02-4-B_flat.csv
#
# - Output: analysis_df.rd

# Load setup
source("B_Prog/0setup.R")

# Get shape file data
# © GeoBasis-DE / BKG 2024
# https://gdz.bkg.bund.de/index.php/default/digitale-geodaten/verwaltungsgebiete/
# verwaltungsgebiete-1-2-500-000-stand-31-12-vg2500-12-31.html

shape_data <- st_read("A_Orig/VG2500_KRS.shp")
shape_data <- shape_data |> filter(substr(AGS, 1, 2) == "08" |
                                     substr(AGS, 1, 2) == "09")

# Get tourism data
# Statistik ID 45412-03-02-4-B
# From regionalstatistik.de
tourism_data <- read_delim("A_Orig/45412-03-02-4-B_flat.csv",
                           delim = ";", escape_double = FALSE, trim_ws = TRUE)
tourism_data <- tourism_data |>
  filter(substr(`1_Auspraegung_Code`, 1, 2) == "08" |
           substr(`1_Auspraegung_Code`, 1, 2) == "09") |>
  filter(Zeit == 2023) |>
  filter(`2_Auspraegung_Label` == "Insgesamt") |>
  filter(!is.na(GAST02__Gaesteuebernachtungen__Anzahl)) |>
  select(AGS = `1_Auspraegung_Code`,
         overnight_stays = GAST02__Gaesteuebernachtungen__Anzahl)

# Combine datasets
analysis_df <- shape_data |>
  left_join(tourism_data, by = "AGS") |>
  mutate(overnight_stays = as.integer(overnight_stays))

analysis_df <- st_transform(analysis_df, crs = 4326)

# Add University Hospitals
uniklinik_ags <- c("09162", "09562", "09663", "09362", "09761", "09564",
                   "08311", "08221", "08421", "08416", "08222")

analysis_df$uniklinik <- ifelse(substr(analysis_df$AGS, 1, 5) %in% uniklinik_ags, 1, 0)

analysis_df$uniklinik <- factor(analysis_df$uniklinik, levels = c(0, 1),
                                labels = c("No University Hospital", "University Hospital"))

# Save intermediate dataset
saveRDS(analysis_df, "C_Temp/analysis_df.rds")

# Clean workspace
rm(analysis_df, shape_data, tourism_data, uniklinik_ags)
