# **Coding and Data Science Project**


This project showcases my data visualisation work as part of the 'Coding Skills and Data Science' (BIO319) module during my third year studying Biology at Queen Mary University of London. Using real-world datasets, I applied coding principles to clean, preprocess, and visualise data. The portfolio highlights my skills in R programming, particularly in data manipulation and creating insightful visualisations with packages like ggplot2, tidyverse, and patchwork.

## Data
The data used in this project was provided by Queen Mary and some datasets were sourced from `dung_beetles.csv`. It contains monthly counts of various beetle species, detailing their genus and species. The dataset is of moderate size, containing columns for months and species counts. Key preprocessing steps included:
- Converting column names to lowercase.
- Removing unnecessary columns.
- Renaming certain columns for consistency.
- Reshaping the data for easier analysis.
- Splitting species names into genus and species components.

## Methodology
The analysis and visualisation process involved several key steps:
1. **Data Cleaning and Preparation**: Standardised column names, removed irrelevant columns, and reshaped the dataset.
2. **Grouping and Summarising Data**: Calculated total beetle counts for each month and analysed the distribution of species.
3. **Visualisation Techniques**: Utilised `ggplot2` for creating various plots and `patchwork` for arranging multiple plots together. Additionally, `RColorBrewer` was used to enhance color schemes in the visualisations.

The R packages used in this project include:
- `tidyverse`: For data manipulation and visualisation.
- `RColorBrewer`: For color palettes.
- `patchwork`: For combining multiple plots.

## Data Visualisation by Labelling Data Points and Manipulating Graphic Optics - Workshop 9

The following graphs are from Workshop 9. You can find the related files in the directory: Workshop9.html and Workshop9Script.R. These plots demonstrate various data visualisation techniques using the penguins dataset and other data sources. Each image is accompanied by a description to explain the techniques and customisations applied.

### Gentoo Plot
![Gentoo Plot](./Images_for_Git/gentoo_plot.png)
*Description: For the Gentoo plot, we're utilising the geom_text() function with our big_penguins dataframe. Although geom_text() is used with a different dataset, it inherits the position mappings from ggplot(), ensuring accurate label placement. To prevent labels from overlapping with the data points, we use the nudge parameters to slightly shift the labels down and to the left. Additionally, the xlim() function extends the x-axis to avoid cutting off the names, ensuring all labels are fully visible.*

### Adelie Plot
![Adelie Plot](./Images_for_Git/adelie_plot.png)
*Description: This code filters the penguins dataset to include only Adelie penguins with flipper lengths greater than 200 mm and then labels these points with their corresponding islands. The nudge_y parameter is used to slightly adjust the position of the labels.*

### Deaths by Country
![Deaths by Country](./Images_for_Git/deaths_by_country.png)
*Description: In this code, the ~ operator specifies the variable used to split the data into separate plots. The ncol parameter sets the number of columns, while dir controls the wrapping direction. This approach effectively visualises data subsets by categorical variables.*

### Penguins Plot
![Penguins Plot](./Images_for_Git/penguins_plot.png)
*Description: In this example, the plots are separated by both sex and species, creating a grid of plots that makes it easy to compare these categories against each other.*

### Combined Plot
![Combined Plot](./Images_for_Git/combined_plot.png)
*Description: The new operator, %in%, in the code above is handy for subsetting. Here it’s used with a vector written on the fly, but a variable that contains a vector made previously can also be used.*

### Brew Combined Plot
![Brew Combined Plot](./Images_for_Git/brew_combined_plot.png)
*Description: This image shows the application of ColorBrewer palettes to a dataset. The first plot uses a sequential palette ("Set1") suitable for ordered data, while the second plot applies a categorical palette ("Dark2") with reversed direction, demonstrating how different palette types can be used to highlight various data features effectively.*

### Viri Combined Plot
![Viri Combined Plot](./Images_for_Git/viri_combined_plot.png)
*Description: This image demonstrates the use of viridis color scales, which are designed to be color-blind friendly. The first plot uses the default "viridis" option, while the second plot applies the "plasma" option, showcasing how these palettes provide better visibility and accessibility for people with color vision deficiencies.*

### Continuous Combined Plot
![Con Combined Plot](./Images_for_Git/con_combined.png)
*Description: This image illustrates the application of continuous color scales. The first plot uses the default color mapping for the body mass of penguins, while the second plot applies the "magma" option of the viridis scale, enhancing the visualisation with a continuous color gradient that improves interpretability.*

### Bill Dimensions vs Body Mass
![Bill Dimensions vs Body Mass](./Images_for_Git/bill_dimensions_vs_body_mass.png)
*Description: This image demonstrates how to customise various elements of a ggplot. It shows modifications to the axis titles, axis lines, text, panel background, and plot title, highlighting the flexibility and control available through the theme() function.*

### Flipper Length Distribution
![Flipper Length Distribution](./Images_for_Git/flipper_length_distribution.png)
*Description: This image illustrates how to modify the position and appearance of the legend using the theme() function in ggplot2. By placing the legend inside the plot and removing the legend background, we can save space and make the plot more compact.*

### Plotting Only a Subset of Your Data Graph
![Plotting Only a Subset of Your Data](./Images_for_Git/plotting_only_a_subset_of_your_data_graph.png)
*Description: This image highlights the relationship between flipper length (in mm) and body mass (in grams) for penguins, excluding the Chinstrap species. The points are coloured by species and shaped according to the island where the penguins were found, allowing visual differentiation of both variables.*

### Geom Violin with Labels Plot
![Geom Violin with Labels](./Images_for_Git/geom_violin_with_labels_plot.png)
*Description: This image shows a violin plot of body mass distribution (in grams) for different penguin species, separated by male, female, and unknown sex. Different colours—yellow for females, magenta for males, and grey for unknown—are used to distinguish sex, with a customised legend.*

### Malaria Deaths in 2020
![Malaria Deaths in 2020](./Images_for_Git/malaria_deaths_in_2020.png)
*Description: This image illustrates a horizontal bar plot showing malaria deaths by country in 2020. The data is first filtered to include only the year 2020 and sorted in ascending order of deaths. Countries are then converted into factors based on this order to ensure they appear correctly on the y-axis. The ggplot uses geom_col() to create bars, and coord_flip() flips the axes for a horizontal display.*

### Malaria Cases and Deaths in High Burden Countries 2000-2021 Graph
![Malaria Cases and Deaths in High Burden Countries 2000-2021](./Images_for_Git/malaria_cases_and_deaths_in_high_burden_countries_2000-2021_graph.png)
*Description: This image showcases a combined plot showing malaria cases and deaths in high-burden countries from 2000 to 2021. A line plot represents the number of cases over time, while a bar chart shows total deaths. Customisations include axis labels, the "Set1" colour palette, and the removal of x-axis labels and legends in the case plot. The death plot includes a legend at the bottom, and both plots are combined with a title using plot_annotation().*

### View folder with images [HERE](./Images_for_Git).
