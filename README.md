# CIND820_Capstone_Project
"Comparative Analysis of Machine Learning Models for Home Sale Price Classification: A Study Using the Ames Housing Dataset"

Project Stages-Detailed Metholodlogy is Given Below 

1)EDA
2) Replication of a Project(Advanced Regression Techniques on Ames Housing Dataset) 
3) Using Different Cleaning Methods to see how models perform
4) Checking the viability of Simple Linear Regression and deciding not to use it
5) Adding Random Forest and Decisions Tree models and R2 Evaluation Metric to the original model
6)Averaging Models 


Revised Project Methodology:

Data Loading:

Load essential Python libraries such as Pandas, NumPy, Seaborn, Matplotlib, and Scikit-Learn.
Load the training data from CSV files into a Pandas DataFrame.
Separate the features from the target variable 'SalePrice.'
Load the test data and concatenate both datasets for consistency.

Exploratory Data Analysis (EDA):

Perform EDA to gain a deep understanding of the dataset.
Display the first few rows of the data.
Check column names and obtain summary statistics.
Identify potential outliers using correlations and scatter plots.
Examine the distribution of the target variable, 'SalePrice.'
Identify numerical and categorical features.
Explore top numerical features correlated with 'SalePrice.'
Select significant categorical variables.
Visualize relationships and correlations between variables.

Multicollinearity and Linear Relationship Assessment:

Verify the dataset's alignment with key assumptions of linear regression.
Assess the presence of multicollinearity among independent variables.
Evaluate the linearity of relationships between independent and dependent variables.
Note that, based on the assessment, many variables do not exhibit a linear relationship, and multicollinearity exists, making simple linear regression unsuitable.

Viability Checks for Linear Regression:

Since linear regression is not suitable due to multicollinearity and lack of linear relationships, focus on assessing other models.

Feature Engineering:

Create new features to capture additional information.
Label encode ordinal categorical features.
Transform numerical variables into categorical ones.
Address skewness in numerical data using log transformation.

Model Evaluation and Selection:

Evaluate a set of regression and classification models:

Ridge Regression with L2 regularization (optimize alpha).
Lasso Regression with L1 regularization (optimize alpha).
XGBoost (a classification model) for regression tasks.
Random Forest (a classification model) for regression tasks.
Decision Tree (a classification model) for regression tasks.
Evaluate models using regression metrics such as R2 and Mean Squared Logarithmic Error (RMSLE).
Select the best-performing model based on the evaluation metrics.

Comparative Analysis of Models:

Perform a comparative analysis of Ridge, Lasso, XGBoost, Random Forest, and Decision Tree models.
Assess the strengths and weaknesses of various modeling techniques.

Conclusion:
Summarize the methodology and findings, emphasizing the importance of data preprocessing, feature engineering, and model selection.
Highlight the suitability of advanced models like XGBoost, Random Forest, and Decision Tree for the given dataset, considering the multicollinearity and non-linearity of relationships.

Contents of Repository:
1) Initial EDA Results
2) Part 1 of Project Replication 
3) Part 2 of trying to create models with cleanign data properly and removing outliers
4 )Part 3 of Checking Linear Model Viability, Making a Decision on Not Using Simple Linear Regression, Adding Classification Models Random Forest & Decision Tree and Also R2 Evaluation Metric along with RMSLE use in the original project
5) The working dataset Train and Test set
