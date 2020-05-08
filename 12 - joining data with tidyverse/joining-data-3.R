inventory_parts_joined %>%
  # Combine the sets table with inventory_parts_joined 
  inner_join(sets, by = "set_num") %>%
  # Combine the themes table with your first join 
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Count the part number and color id, weight by quantity
batman %>%
  count(part_num,color_id, wt = quantity)
star_wars %>%
  count(part_num,color_id, wt = quantity)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
batman_parts %>%
  # Combine the star_wars_parts table 
  full_join(star_wars_parts, by = c("part_num","color_id"), suffix = c("_batman", "_star_wars")) %>%
  # Replace NAs with 0s in the n_batman and n_star_wars columns 
  replace_na(list(n_batman=0, n_star_wars = 0) )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
parts_joined %>%
  # Sort the number of star wars pieces in descending order 
  arrange(desc(n_star_wars)) %>%
  # Join the colors table to the parts_joined table
  inner_join(colors, by = c("color_id" = "id") ) %>%
  # Join the parts table to the previous join 
  inner_join(parts, by = "part_num", suffix = c("_color", "_part") )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====