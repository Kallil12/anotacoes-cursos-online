# Filter the batwing set for parts that are also in the batmobile set
batwing %>%
  semi_join(batmobile, by = c("part_num"))

# Filter the batwing set for parts that aren't in the batmobile set
batwing %>%
  anti_join(batmobile, by = c("part_num"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Use inventory_parts to find colors included in at least one set
colors %>%
  semi_join(inventory_parts, by = c("id" = "color_id"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Use filter() to extract version 1 
version_1_inventories <- inventories %>%
  filter(version == 1)

# Use anti_join() to find which set is missing a version 1
sets %>%
  anti_join(version_1_inventories, by = c("set_num"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
batman_colors <- inventory_parts_themes %>%
  # Filter the inventory_parts_themes table for the Batman theme
  filter(name_theme == "Batman") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  # Add a percent column of the total divided by the sum of the total 
  mutate(percent = total/sum(total))

# Filter and aggregate the Star Wars set data; add a percent column
star_wars_colors <- inventory_parts_themes %>%
  filter(name_theme == "Star Wars") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  mutate(percent = total/sum(total))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
batman_colors %>%
  full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
  inner_join(colors, by = c("color_id" = "id")) %>%
  # Create the difference and total columns
  mutate(difference = percent_batman - percent_star_wars,
         total = total_batman + total_star_wars) %>%
  # Filter for totals greater than 200
  filter(total >= 200)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Create a bar plot using colors_joined and the name and difference columns
ggplot(colors_joined, aes(name,difference, fill = name)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = color_palette, guide = FALSE) +
  labs(y = "Difference: Batman - Star Wars")
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Replace the NAs in the tag_name column
questions %>%
  left_join(question_tags, by = c("id" = "question_id")) %>%
  left_join(tags, by = c("tag_id" = "id")) %>%
  replace_na(list(tag_name = "only-r"))

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
questions_with_tags %>%
  # Group by tag_name
  group_by(tag_name) %>%
  # Get mean score and num_questions
  summarize(score = mean(score),
            num_questions = n()) %>%
  # Sort num_questions in descending order
  arrange(desc(num_questions))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Using a join, filter for tags that are never on an R question
tags %>%
  anti_join(question_tags, by = c("id"="tag_id"))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
questions %>%
  # Inner join questions and answers with proper suffixes
  inner_join(answers, by=c("id"="question_id"), suffix=c("_question", "_answer") ) %>%
  # Subtract creation_date_question from creation_date_answer to create gap
  mutate(gap = as.integer(creation_date_answer - creation_date_question))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Count and sort the question id column in the answers table
answer_counts <- answers %>%
  count(question_id, sort = TRUE)

# Combine the answer_counts and questions tables
questions %>%
  left_join(answer_counts, by=c("id" = "question_id"),suffix=c("_question", "_answer") ) %>%
  # Replace the NAs in the n column
  replace_na(list(n=0))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
question_answer_counts %>%
  # Join the question_tags tables
  inner_join(question_tags, by=c("id"="question_id")) %>%
  # Join the tags table
  inner_join(tags,by=c("tag_id"="id") )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
tagged_answers %>%
  # Aggregate by tag_name
  group_by(tag_name)%>%
  # Summarize questions and average_answers
  summarize(questions = n(),
            average_answers = mean(n)) %>%
  # Sort the questions in descending order
  arrange(desc(questions))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Inner join the question_tags and tags tables with the questions table
questions %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

# Inner join the question_tags and tags tables with the answers table
answers %>% 
  inner_join(question_tags, by= "question_id" )%>%
  inner_join(tags, by=c("tag_id"="id") )
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Combine the two tables into posts_with_tags
posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
                             answers_with_tags %>% mutate(type = "answer"))

# Add a year column, then aggregate by type, year, and tag_name
posts_with_tags %>%
  mutate(year = year(creation_date)) %>%
  count(type, year, tag_name)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Filter for the dplyr and ggplot2 tag names 
by_type_year_tag_filtered <- by_type_year_tag %>%
  filter(tag_name %in% c("dplyr", "ggplot2"))

# Create a line plot faceted by the tag name 
ggplot(by_type_year_tag_filtered, aes(year, n, color = type)) +
  geom_line() +
  facet_wrap(~ tag_name)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====