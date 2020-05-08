
# Combine the star_destroyer and millennium_falcon tables
millennium_falcon %>%
  left_join(star_destroyer, by = c("part_num","color_id"), 
            suffix = c("_falcon","_star_destroyer") )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Aggregate Millennium Falcon for the total quantity in each part
millennium_falcon_colors <- millennium_falcon %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

# Aggregate Star Destroyer for the total quantity in each part
star_destroyer_colors <- star_destroyer %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

# Left join the Millennium Falcon colors to the Star Destroyer colors
millennium_falcon_colors %>%
  left_join(star_destroyer_colors, by = c("color_id"), suffix = c("_falcon", "_star_destroyer") )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
inventory_version_1 <- inventories %>%
  filter(version == 1)

# Join versions to sets
sets %>%
  left_join(inventory_version_1, by = c("set_num")) %>%
  # Filter for where version is na
  filter(is.na(version))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
parts %>%
  count(part_cat_id) %>%
  right_join(part_categories, by = c("part_cat_id" = "id")) %>%
  # Filter for NA
  filter(is.na(n) )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
parts %>%
  count(part_cat_id) %>%
  right_join(part_categories, by = c("part_cat_id" = "id")) %>%
  # Use replace_na to replace missing values in the n column
  replace_na(list(n=0) )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
themes %>% 
  # Inner join the themes table
  inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
  # Filter for the "Harry Potter" parent name 
  filter(name_parent == "Harry Potter")
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Join themes to itself again to find the grandchild relationships
themes %>% 
  inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
  inner_join(themes, by = c("id_child" = "parent_id"), suffix = c("_parent", "_grandchild"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
themes %>% 
  # Left join the themes table to its own children
  left_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
  # Filter for themes that have no child themes
  filter(is.na(name_child))