# Recode cls_students as cls_type
evals_fortified <- evals %>%
  mutate(
    cls_type = case_when(
      evals$cls_students <= 18 ~ "small",
      evals$cls_students <= 59 & evals$cls_students >= 19 ~ "midsize",
      evals$cls_students >= 60 ~ "large"
    )
  )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Scatterplot of score vs. bty_avg
ggplot(evals, aes(bty_avg,score)) +
  geom_point()
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
