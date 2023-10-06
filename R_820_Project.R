# Set the working directory to the folder containing the dataset
setwd("C:\\Users\\imali\\OneDrive\\Ames_Dataset")

# Read the Ames Housing dataset from the downloaded CSV file
ames_data <- read.csv("AmesHousing.csv")

# Display the first few rows of the dataset
head(ames_data)

# Load required libraries
library(dplyr)     # Data manipulation
library(ggplot2)   # Data visualization
library(tidyr)     # Data tidying
library(scales)    # Plot scales
install.packages("gridExtra")
library(gridExtra)

# Summary Statistics
summary(ames_data)

# Check the total number of variables (columns)
num_variables <- ncol(ames_data)
print(num_variables)

head(ames_data)

# Check the column names in the dataset
colnames(ames_data)

#Missing Data Analysis
missing_data <- sapply(ames_data, function(x) sum(is.na(x)))
missing_data[missing_data > 0]

# Impute missing values with the mean for numeric columns
numeric_cols <- sapply(ames_data, is.numeric)
ames_data[, numeric_cols] <- lapply(ames_data[, numeric_cols], function(x) {
  if (any(is.na(x))) {
    x[is.na(x)] <- mean(x, na.rm = TRUE)
  }
  return(x)
})
# Calculate z-scores for SalePrice
z_scores <- scale(ames_data$SalePrice)

# Remove rows with z-scores greater than 3 or less than -3
ames_data <- ames_data[abs(z_scores) <= 3, ]

for (col in names(ames_data)) {
  if (is.character(ames_data[[col]])) {
    ames_data[[col]] <- factor(ames_data[[col]])
  }
}

# Check for duplicate rows
duplicated_rows <- duplicated(ames_data)
ames_data <- ames_data[!duplicated_rows, ]

# Check for constant columns and remove them
ames_data <- ames_data[, !sapply(ames_data, function(x) length(unique(x)) == 1)]# Save the cleaned dataset to a new CSV file

write.csv(ames_data, "AmesHousing_cleaned.csv", row.names = FALSE)
# Check the total number of variables (columns)
num_variables <- ncol(ames_data)
print(num_variables)


# Distribution of Sale Price
ggplot(ames_data, aes(x = SalePrice)) +
  geom_histogram(binwidth = 10000, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Sale Price", x = "Sale Price")

# Install and load the reshape2 package
install.packages("reshape2")
library(reshape2)

# Now, you can create the correlation heatmap with the melt function
correlation_matrix <- cor(select_if(ames_data, is.numeric))

# Create the heatmap
ggplot(data = melt(correlation_matrix), aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  theme_minimal() +
  labs(title = "Correlation Heatmap")


# Relationship Between Features and Sale Price
# Scatterplot of Living Area vs. Sale Price
ggplot(ames_data, aes(x = Gr.Liv.Area, y = SalePrice)) +
  geom_point(color = "blue") +
  labs(title = "Living Area vs. Sale Price", x = "Living Area", y = "Sale Price")

# Box plot of Overall Quality vs. Sale Price
ggplot(ames_data, aes(x = factor(Overall.Qual), y = SalePrice)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Overall Quality vs. Sale Price", x = "Overall Quality", y = "Sale Price")

# Categorical Variables
# Bar plot for Neighborhood
ggplot(ames_data, aes(x = Neighborhood)) +
  geom_bar(fill = "skyblue", color = "black") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Distribution of Neighborhood", x = "Neighborhood")

# Time Series Analysis (if applicable)
# Time series plot for Year Built vs. Sale Price
ggplot(ames_data, aes(x = Year.Built, y = SalePrice)) +
  geom_line(color = "blue") +
  labs(title = "Sale Price Over Time", x = "Year Built", y = "Sale Price")

# Outlier Detection
# Box plot for Sale Price
ggplot(ames_data, aes(y = SalePrice)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Box Plot for Sale Price", y = "Sale Price")



# Scatter plot for Living Area vs. Sale Price (outliers)
ggplot(ames_data, aes(x = Gr.Liv.Area, y = SalePrice)) +
  geom_point(color = "blue") +
  labs(title = "Scatter Plot for Living Area vs. Sale Price (Outliers)", x = "Living Area", y = "Sale Price")

# Select the numeric variables for the pairplot
numeric_vars <- c("SalePrice", "Gr.Liv.Area", "Total.Bsmt.SF", "Overall.Qual")

# Create a matrix of scatterplots
pairs(ames_data[, numeric_vars], pch = 20, col = ames_data$Overall.Qual)



# Additional Visualizations (as needed)

# Arrange plots using gridExtra
grid.arrange(plot1, plot2, plot3, ncol = 2) # Replace plot1, plot2, and plot3 with your additional visualizations

# Save plots to a file (if desired)
ggsave("eda_plots.png", plot = last_plot(), width = 12, height = 8)

# Summarize findings and draw insights from the EDA


