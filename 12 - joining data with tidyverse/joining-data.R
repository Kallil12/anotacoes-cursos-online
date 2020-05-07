# joning data

# Add the correct verb, table, and joining column
parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"))


# Use the suffix argument to replace .x and .y suffixes
parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"), suffix = c("_part","_category"))

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Combine the parts and inventory_parts tables
parts %>%
  inner_join(inventory_parts, by = "part_num")
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Combine the parts and inventory_parts tables
inventory_parts %>%
  inner_join(parts, by = "part_num")
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
sets %>%
  # Add inventories using an inner join 
  inner_join(inventories, by = "set_num") %>%
  # Add inventory_parts using an inner join 
  inner_join(inventory_parts, by = c("id" = "inventory_id"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Add an inner join for the colors table
sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set","_color"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Count the number of colors and sort
sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color")) %>%
  count(name_color, sort = TRUE)