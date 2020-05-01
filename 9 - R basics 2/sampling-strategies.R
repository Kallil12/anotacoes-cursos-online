install.packages("openintro")
library(openintro)
library(dplyr)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Simple random sample: states_srs
states_srs <- us_regions %>%
  sample_n(size = 8)

# Count states by region
states_srs %>%
  count(region)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Stratified sample in R
# Stratified sample
states_str <- us_regions %>%
  group_by(region) %>%
  sample_n(size = 2)

# Count states by region
states_str %>%
  count(region)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====