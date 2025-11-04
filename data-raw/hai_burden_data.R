library(tibble)
library(usethis)

hai_burden <- tribble(
  ~Measure,               ~Sample,               ~HAP,   ~UTI,   ~BSI,   ~SSI,   ~CDI,   ~All,
  "HAIs_per_100k",        "German_PPS",          132.0, 265.1, 33.4, 115.4, 44.6, 592.1,
  "HAIs_per_100k",        "German_convenience",  162.3, 228.7, 52.7, 146.9, 44.5, 636.1,
  "HAIs_per_100k",        "EU_EEA",              143.7, 174.7, 22.2, 111.3, 16.0, 467.9,
  "Deaths_per_100k",      "German_PPS",          4.9,   4.5,   4.8,   2.9,   2.4,   20.1,
  "Deaths_per_100k",      "German_convenience",  6.1,   3.9,   7.9,   3.7,   2.5,   24.4,
  "Deaths_per_100k",      "EU_EEA",              5.3,   3.0,   3.3,   2.6,   0.9,   15.3,
  "DALYs_per_100k",       "German_PPS",          86.1,  82.6,  72.2,  35.7,  25.9,  308.2,
  "DALYs_per_100k",       "German_convenience", 103.4,  69.5, 113.5,  45.0,  26.5,  359.3,
  "DALYs_per_100k",       "EU_EEA",             109.8,  57.1,  76.2,  35.1,  10.0,  290.0
)

usethis::use_data(hai_burden, overwrite = TRUE)

