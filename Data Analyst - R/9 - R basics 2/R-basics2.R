#Types of study:
#  observational study:
#  collect data in a way that does not directly interfere with how the data as.relistable;
#  only correlation can be inferred.

# experiment:
#   randomly assign subjects to various treatments;
#   causation can be inferred
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
#Random sampling and random assignment
#random sampling - at selection of subjects from population; helps generalizability of results

#random assignment - assignment of subjects to various treatments; helps infer causation from results

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
#Simpson's paradox:

#Explanatory and response
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Load packages
library(dplyr)

# Count number of male and female applicants admitted
ucb_admit %>%
  count(Gender, Admit)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# mutate creates a new variable
ucb_admission_counts %>%
  # Group by gender
  group_by(Gender) %>%
  # Create new variable
  mutate(prop = n/sum(n)) %>%
  # Filter for admitted
  filter(Admit == "Admitted")
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

ucb_admission_counts  %>%
  # Group by department, then gender
  group_by(Dept, Gender) %>%
  # Create new variable
  mutate(prop = n/sum(n)) %>%
  # Filter for male and admitted
  filter(Gender == "Male"& Admit == "Admitted")
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
