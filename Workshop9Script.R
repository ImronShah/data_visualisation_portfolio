install.packages("palmerpenguins")
library(palmerpenguins)
install.packages("tidyverse")
library(tidyverse)

# Subset penguins dataframe to the the five heaviest penguins
big_penguins <- penguins %>%
  filter(species == "Gentoo",!is.na(body_mass_g)) %>% 
  arrange(body_mass_g) %>% tail(n = 5L)

# Add a column with names to big_penguins
big_penguins$names <- c("Dwayne", "Hulk", "Giant", "Gwendoline", "Usain")

# Filter penguins dataset for Gentoo species
gentoo_penguins <- penguins %>% filter(species == "Gentoo")

# Filter penguins dataset for Adelie species
adelie_penguins <- penguins %>% filter(species == "Adelie")

# Plot for Gentoo species
plot_gentoo <- ggplot(gentoo_penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point(aes(colour = flipper_length_mm)) +
  geom_text(
    data = big_penguins,
    mapping = aes(label = names),
    nudge_x = -1.5,
    nudge_y = -0.5,
    colour = "red"
  ) +
  xlim(3900, 6400)

# Save the plot for Gentoo species as an image
ggsave("gentoo_plot.png", plot = plot_gentoo, width = 6, height = 4, units = "in", dpi = 300)

# Plot for Adelie species
plot_adelie <- ggplot(adelie_penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point() +
  geom_text(
    data = filter(penguins, species == "Adelie" &
                    flipper_length_mm > 200),
    aes(label = island),
    nudge_y = -0.7
  )

# Save the plot for Adelie species as an image
ggsave("adelie_plot.png", plot = plot_adelie, width = 6, height = 4, units = "in", dpi = 300)

# we have to filter for the species again in geom_text because it is a different species we want to look at

# facets

# Reading in data
modeltab <- read.table("wmr_modelling.txt",sep="\t",header=T)

# Subsetting to the first half or so for readability
modeltab_short <- head(modeltab, n = 506L)

# Plotting deaths in years 2019-2021 faceted by country
filtered_data <- modeltab_short %>%
  drop_na() %>%
  filter(year > 2018)

# Plotting
plot <- ggplot(filtered_data, aes(x = year, y = deaths)) +
  geom_col(fill = "firebrick") +
  facet_wrap(~country, ncol = 5, dir = "v")

# Save the plot as an image
ggsave("deaths_by_country.png", plot = plot, width = 10, height = 6, units = "in", dpi = 300)

# A set of variables or expressions quoted by vars() and defining faceting groups on the rows or columns dimension. 

# Filter and clean data
cleaned_data <- penguins %>%
  drop_na()

# Plotting
plot <- ggplot(cleaned_data, aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point() +
  facet_grid(sex ~ species)

# Save the plot as an image
ggsave("penguins_plot.png", plot = plot, width = 10, height = 6, units = "in", dpi = 300)

# The formula in facet_grid() determines first the rows, then the columns.

p_plot <- penguins %>% drop_na() %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point()

p_plot + facet_grid(. ~ species)
p_plot + facet_grid(species ~ .)

# 4

install.packages("patchwork")
library(patchwork)

p1 <- penguins %>% drop_na() %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, colour = species)) +
  geom_point() + facet_grid(. ~ species)

p2 <- penguins %>%  drop_na() %>%
  ggplot(aes(x = flipper_length_mm)) +
  geom_histogram(aes(fill = species), position = "identity")

p3 <- penguins %>% drop_na() %>% 
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex))

p1/(p2+p3)

p2 | (p1/p3)

# Patchwork allows you to add annotations using the plot_annotation() function:

p1/(p2+p3) + plot_annotation(tag_levels = "a",
                             title = "Plenty of penguin plots")

p_deaths <- modeltab %>% filter(country %in% c("Angola", "Burkina Faso", "Chad")) %>% 
  ggplot(aes(x = year, y = deaths, colour = country)) +
  geom_point() +
  geom_line() +
  xlim(1999,2022)

p_pop <- modeltab %>% filter(country %in% c("Angola", "Burkina Faso", "Chad")) %>% 
  ggplot(aes(x = year, y = population, fill = country)) +
  geom_col(position = "dodge") +
  xlim(1999,2022)

# Overlay the plots
combined_plot <- p_deaths / p_pop

# Export the combined plot
ggsave("combined_plot.png", plot = combined_plot, width = 10, height = 6, units = "in", dpi = 300)

# Colours

# Discrete colour scales

s_counts <- penguins %>% ggplot(aes(x = species, fill = species)) +
  geom_bar()

s_counts + scale_fill_manual(values = c("yellow2", "magenta", "darkblue"))

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

# Define brew_1 and brew_2 plots
brew_1 <- s_counts + scale_fill_brewer(palette = "Set1")
brew_2 <- s_counts + scale_fill_brewer(palette = "Dark2", direction = -1)

# Combine brew_1 and brew_2
brew_combined <- brew_1 + brew_2

# Define viri_1 and viri_2 plots
viri_1 <- s_counts + scale_fill_viridis_d() # Uses default option viridis
viri_2 <- s_counts + scale_fill_viridis_d(option = "plasma")

# Combine viri_1 and viri_2
viri_combined <- viri_1 + viri_2

# Export the combined plots
ggsave("brew_combined_plot.png", plot = brew_combined, width = 10, height = 6, units = "in", dpi = 300)
ggsave("viri_combined_plot.png", plot = viri_combined, width = 10, height = 6, units = "in", dpi = 300)

# continuous colour scales

con_plot_1 <- penguins %>% drop_na() %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(aes(size = body_mass_g, colour = body_mass_g))

con_plot_2 <- con_plot_1 + scale_colour_viridis_c(option = "magma")

con_combined <- con_plot_1 + con_plot_2

ggsave("con_combined.png", plot = con_combined, width = 10, height = 6, units = "in", dpi = 300)


# NA values

penguins %>%
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex)) +
  scale_fill_brewer(palette = "Set2", na.value = "yellow2")

# Themes

con_plot_3 <- con_plot_1 + theme_classic()

con_plot_1 + con_plot_3 + plot_annotation(title = "Default theme on the left, theme_classic() on the right")
library(ggplot2)
library(viridis)
library(dplyr)

# Plot 1
plot1 <- penguins %>% drop_na() %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(aes(colour = body_mass_g)) +
  labs(title = "Bill dimensions vs. Body mass") +
  scale_colour_viridis_c(option = "magma") +
  theme(legend.position = "bottom",
        axis.title.x = element_text(colour = "red", size = 14, hjust = 1),
        axis.title.y = element_blank(),
        axis.line.y = element_line(colour = "cornflowerblue", size = 4),
        axis.text.y = element_text(size = 20, angle = 45),
        panel.background = element_rect(colour = "green", fill = "yellow", size = 10),
        plot.title = element_text(family = "Times", face = "italic",  hjust = 0.5, size = 18))

ggsave("bill_dimensions_vs_body_mass.png", plot = plot1, width = 10, height = 6, units = "in", dpi = 300)

# Plot 2
plot2 <- penguins %>%  drop_na() %>%
  ggplot(aes(x = flipper_length_mm)) +
  geom_histogram(aes(fill = species), position = "identity") +
  labs(title = "Flipper length distribution") +
  theme(legend.position = c(0.9,0.85),
        legend.background = element_blank())

ggsave("flipper_length_distribution.png", plot = plot2, width = 10, height = 6, units = "in", dpi = 300)

# 7 Exercises

penguins %>% filter(island == "Biscoe") %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(colour = species)) +
  geom_text(
    data = filter(penguins, island == "Biscoe" &
                    (bill_length_mm > 54 |
                       bill_depth_mm > 20)
    ),
    aes(label = sex),
    nudge_y = -0.7
  ) +
  labs(title = "Penguins on the island Biscoe")

# 2

# Reading in data
modeldeath <- read.table("wmr_cases_deaths_modelling_summaries.txt",sep="\t",header=T)

# Plotting deaths in years 2019-2021 faceted by country
modeldeath %>% filter(!region == "Total") %>% 
  ggplot(aes(x = year, y = deaths)) +
  geom_col(fill = "dodgerblue4") +
  facet_wrap(~region, scales = "free")

# 3 Patchwork: Using the datasets in wmr_modelling.txt and wmr_cases_deaths_modelling_summaries.txt produce a publication-style figure. It should contain at least three plots, one with faceting, arranged with patchwork.

# Load necessary libraries
library(ggplot2)
library(patchwork)

# Read in the datasets
modeltab <- read.table("wmr_modelling.txt", sep = "\t", header = TRUE)
modeldeath <- read.table("wmr_cases_deaths_modelling_summaries.txt", sep = "\t", header = TRUE)

# Prepare the data for plotting
# You may need to perform data manipulation and aggregation to create suitable datasets for plotting

# Create individual plots
plot1 <- ggplot(data = modeltab, aes(x = year, y = deaths)) +
  geom_line() +
  labs(title = "Deaths Over Time") +
  theme_minimal()

plot2 <- ggplot(data = modeltab, aes(x = year, y = population)) +
  geom_line() +
  labs(title = "Population Over Time") +
  theme_minimal()

plot3 <- ggplot(data = modeldeath, aes(x = year, y = deaths)) +
  geom_col(fill = "dodgerblue4") +
  facet_wrap(~region, scales = "free") +
  labs(title = "Deaths by Region") +
  theme_minimal()

# Arrange the plots using Patchwork
combined_plot <- plot1 / (plot2 | plot3)

# Fine-tune the appearance and annotations of the combined figure
# You can add additional annotations, adjust axis labels, titles, etc.

# Display the combined plot
combined_plot

# Challenge Use wmr_modelling.txt to reproduce this plot. High burden countries are defined as having had more than 20,000 deaths in 2020. You don’t have to use the exact colours, but pay attention to the changes of axis labels, legend position and so on.

modeltab <- read.table("wmr_modelling.txt",sep="\t",header=T)

highburden <- modeltab$country[modeltab$year==2020 & modeltab$deaths>2e4]

caseplot <- ggplot(filter(modeltab,country %in% highburden),aes(x=year,y=cases,color=country)) + 
  geom_line() + 
  geom_point() + 
  ylab("cases (millions)") +
  theme(legend.position="none",
        axis.text.x=element_blank(),
        axis.title.x=element_blank(),
  ) +
  scale_color_brewer(palette = "Set1")

deathplot <- ggplot(filter(modeltab,country %in% highburden),aes(x=year,y=deaths,fill=country)) + 
  geom_bar(stat="identity") + 
  theme(legend.position="bottom",
        legend.title = element_blank(),
        axis.title.x = element_blank()) +
  scale_fill_brewer(palette = "Set1")

caseplot / deathplot +plot_annotation(title = "Malaria cases and deaths in high burden countries 2000-2021")




