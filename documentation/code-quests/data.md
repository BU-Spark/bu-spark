---
layout: default
title: Data Prep & Visualization
parent: Code Quests
nav_order: 4 # Order under the "Coding Quests" section
permalink: /docs/code-quests/data/
---
# Data Prep & Visualization Main Quest

Data preparation is the crucial first step in the data analysis process. It involves cleaning, transforming, and organizing raw data so it can be analyzed effectively. Think of it as tidying up a messy room—before you can find anything useful, you need to get things in order. This might include handling missing data, removing outliers, or converting categorical data into a numerical format.

Data visualization, on the other hand, is all about making sense of the data by creating visual representations like charts, graphs, and maps. It’s like turning a complex story into a picture book—easier to understand and much more engaging. Visualization helps you see patterns, trends, and outliers that might not be obvious from raw data.
 
### Level One: 
→ Instructions shown below.
### Level Two: 
→ A beginner Side Quest for practicing data preparation and visualization using the Iris dataset. You can accept the assignment [<u>here</u>](https://classroom.github.com/a/lQWzLPSX). 
### Level Three: 
→ Creating your own project. The instructions can be found [<u>here</u>](https://github.com/BU-Spark-Learning-Ambassadors/data-level-3).

---

# Data Prep & Visualization Level One

## VOCABULARY

### I. Data Cleaning & Preparation
*(making raw data usable)*

**Data Preparation** - process of <u>collecting, cleaning, transforming</u>, and <u>organizing raw data</u> into a suitable format for analysis. It ensures that the data is accurate, complete, and ready for modeling.

**Data Cleaning** - process of <u>identifying and correcting or removing errors</u>, <u>inconsistencies, and inaccuracies</u> in the data. This step involves handling missing values, outliers, duplicates, and incorrect data entries.

**Missing Data** - <u>Instances where no data value is stored</u> for a variable in an observation. Missing data can occur due to various reasons, such as errors in data collection, and must be addressed to avoid bias in the analysis.

**Data Imputation** - The process of <u>replacing missing data with substituted values</u>. Imputation is crucial in maintaining the quality of data and ensuring that the analysis or models are not biased by missing information.

**Outliers** - <u>Data points that significantly differ from the rest of the data</u>, either much higher or much lower than the majority. Outliers can indicate variability in the data or errors and can impact the results of statistical analyses.

**Data Aggregation** - The process of <u>summarizing and combining data from multiple sources</u> to provide a broader view. It can involve calculating averages, sums, counts, or other statistics across a data set.

### II. Data Transformation & Feature Processing
*(preparing variables for algorithms)*

**Data Transformation** - process of <u>converting data from one format or structure into another</u>. This may include normalizing, scaling, encoding categorical variables, or applying mathematical functions to prepare the data for analysis.

**Data Normalization** - The process of <u>scaling data to fall within a smaller, specified range</u>, typically between 0 and 1. Normalization is crucial <u>when features (aka variables) have different units or scales</u>, ensuring that no single feature dominates the model’s behavior.

**Z-score Standardization** - A <u>technique to rescale data</u> so that it has a <u>mean of 0 and a standard deviation of 1</u>. Standardization is useful when the data follows a Gaussian distribution and when you want to ensure that each feature (aka variables) contributes equally to the model.

**Categorical Data** - refers to <u>variables that represent categories or groups</u> and can be divided into <u>discrete groups</u> (e.g., colors, types of animals).

**Numerical Data** - refers to <u>variables that represent quantifiable measurements</u> and can be either <u>continuous</u> (e.g., height, weight) or <u>discrete</u> (e.g., number of students).

### III. Exploratory Data Analysis (EDA)
*(understanding patterns and relationships)*

**Exploratory Data Analysis (EDA)** - An <u>approach to</u> analyzing data sets to <u>summarize their main characteristics</u>, often using visual methods. EDA helps to uncover patterns, spot anomalies, test hypotheses, and check assumptions with the help of statistical graphics.

**Correlation** - A statistical measure that <u>describes the extent to which two variables change together</u>. A positive correlation means that as one variable increases, the other tends to increase, while a negative correlation means that as one increases, the other tends to decrease.

**Correlation Matrix** - A <u>table showing the correlation coefficients between variables</u>. Each cell in the matrix shows the correlation between two variables, helping to identify potential relationships or redundancies in the data.

**Dimensionality Reduction** - A process used to <u>reduce the number of input variables or features in a data set</u> by <u>obtaining a set of principal variables</u>. Think of principal variables like the most impactful or informative variables. Techniques like Principal Component Analysis (PCA) help in reducing complexity while retaining the most important information.


### IV. Data Visualization Techniques
*(graphically understanding and communicating data)*

**Data Visualization** - The <u>graphical representation of data</u> to help people understand its significance. Techniques include charts, graphs, and maps, which make it easier to identify trends, patterns, and outliers in large data sets.

**Histogram** - A type of bar chart that <u>represents the distribution</u> of a dataset by <u>showing the frequency of data points within certain ranges</u> (bins). It’s useful for understanding the shape, central tendency, and spread of data.

**Box Plot** - A graphical representation of data that <u>shows the distribution through five summary statistics</u>: <u>minimum, first quartile (Q1), median, third quartile (Q3), and maximum</u>. Box plots are useful for identifying outliers and understanding the spread and skewness of the data.

**Scatter Plot** - A type of plot that <u>displays values for typically two variables for a set of data</u>. The data is displayed as a collection of points, with <u>each point having a value on the horizontal and vertical axes</u>. Scatter plots are useful for identifying relationships and correlations between variables.

**Heatmap** - A data visualization technique that <u>shows the magnitude of a phenomenon as color in at least two dimensions</u>. The variation in color helps to identify patterns, correlations, and outliers in a data set.


## WHAT IS DATA PREPARATION AND VISUALIZATION?
Data preparation is the crucial first step in the data analysis process.
It involves cleaning, transforming, and organizing raw data so it can be
analyzed effectively. Think of it as tidying up a messy room—before you
can find anything useful, you need to get things in order. This might
include handling missing data, removing outliers, or converting
categorical data into a numerical format.

Data visualization, on the other hand, is all about making sense of the
data by creating visual representations like charts, graphs, and maps.
It’s like turning a complex story into a picture book—easier to
understand and much more engaging. Visualization helps you see patterns,
trends, and outliers that might not be obvious from raw data.

### Why Are They Important?
Preparing your data properly is crucial because the quality of your
analysis depends on the quality of your data. Errors in data can lead to
incorrect conclusions, so it's essential to spend time on this step.
Visualizing your data allows you to quickly identify patterns and
relationships that might not be obvious from the raw data alone. It’s a
powerful tool for both exploratory data analysis (EDA) and communicating
your findings.

Understanding data preparation and visualization is essential because
it’s the foundation of any data analysis or machine learning project.
Without clean and well-prepared data, your analysis will likely be
inaccurate or misleading. And without effective visualization, even the
best analysis might go unnoticed because it’s too difficult to
interpret.

### Essentials for Data Preparation:

- **Handle Missing Data**: Identify missing values and decide how to
address them (e.g., remove, fill, or interpolate).

- **Remove Outliers**: Detect outliers and decide if they should be
removed or corrected.

- **Normalize/Standardize Data**: Ensure that your data is on a similar
scale for better comparison and analysis.

- **Transform Categorical Data**: Convert categorical data into numerical
values using techniques like one-hot encoding.

### Creating Visualizations:

- **Import Libraries**: Start by importing libraries such as Matplotlib
and Seaborn.

- **Create Plots**: Use functions like scatter(), hist(), boxplot(), and
heatmap() to create visualizations.

- **Interpret Visualizations**: Analyze the visualizations to understand
the relationships and patterns in your data.


## PRACTICAL EXAMPLE

### Part 1: Preparing Your Data

Before diving into any analysis or visualization, start by loading your
dataset into your Python environment. Let’s assume you’re working with a
dataset of sales data. Here’s a quick guide to get started:

**Load the Data:** Use `pandas` to load your dataset into a DataFrame.

```python
import pandas as pd

data = pd.read_csv('sales_data.csv')
```

**Clean the Data:** Check for **missing values** and **outliers**. Use
`.isnull().sum()` to find missing values and `.describe()` to get an
overview of the data.

```python
data.isnull().sum()
data.describe()
```

Handle **Missing Data**: Decide how to handle missing data. You can
either drop rows with missing values or fill them using **imputation**.

```python
data.dropna(inplace=True)  # Dropping missing values
```

**Normalize the Data:** **Scale** your data if necessary, especially if
you’re planning to use it in a machine learning model.

```python
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()
data_scaled = scaler.fit_transform(data)
```

### Part 2: Visualizing Your Data

Once your data is prepared, you can start **visualizing** it to uncover
insights.

**Histogram**: Visualize the distribution of a single variable, like
sales.

```python
data['sales'].hist(bins=30)
```

**Scatter Plot**: Explore relationships between two variables, like
sales and advertising spend.

```python
data.plot.scatter(x='advertising', y='sales')
```

**Heatmap**: Visualize correlations between multiple variables.

```python
import seaborn as sns

sns.heatmap(data.corr(), annot=True)
```

#### Challenge Exercise:

Using the same sales data, create a **box plot** to visualize the spread
and identify any outliers in the sales data. Try to interpret what the
box plot is telling you.

```python
data.boxplot(column=['sales'])
```

What do you observe from the box plot? Are there any outliers? How does
the spread of the data compare to the mean?

### Part 3: Evaluating Your Visualizations:

*Interpretation:* What do the visualizations tell you about your data?
Are there clear trends or **correlations**? Are there outliers that need
further investigation?

*Communication:* Is your visualization clear and easy to understand?
Would someone unfamiliar with the data be able to grasp the key
insights?

*Next Steps:* Based on your visualizations, what additional analysis or
data preparation might be needed? Do you need to go back and clean the
data further or explore additional variables?

## DRAWBACKS AND LIMITATIONS

Though advantageous, data preparation and visualization can come with
many challenges. Preparing data can be labor-intensive and
*time-consuming*.

Some datasets have immense *complexity* with many variables and missing
values.

Poorly designed visualizations can lead to *misinterpretation* of data.
Visualizations can be *biased* if not carefully designed, leading to
incorrect conclusions.

## REAL-WORLD APPLICATIONS

Business Analytics: Companies use data preparation and visualization to
make informed decisions based on trends and patterns.

Healthcare: Data visualization is used to track and analyze patient
outcomes, treatment effectiveness, and more.

---

## HOW TO CONTINUE THIS MAIN QUEST?  

Take the quiz [<u>here</u>](https://forms.gle/mDvKYWSdcz4SuUhQ6) to finalize Level One, then apply your knowledge with Level Two. After completing that, you can create your own project with some guidelines for Level Three!

---

### For any information or quality issues, please contact:  

Kaylin Von Bergen (Spark! Code Quest Lead) via [<u>GitHub issue</u>](https://github.com/BU-Spark/bu-spark/issues/new?title=Issue%20with%20Code%20Quest%20%E2%80%94%20%5BINSERT%20SPECIFIC%20CODE%20QUEST%5D&body=%40kaylinvonbergen%20%40langdon%0A%0APlease%20describe%20the%20issue%20below%3A%0A)

---

### Author of this Code Quest:  
Seun Ademiloye