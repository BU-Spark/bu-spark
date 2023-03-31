---
layout: default
title: Data Science Tech Stack
parent: Spark! Tech Stack
nav_order: 3
---


# Data Science Tech Stack

By the end of this document, you will have gained an idea of the common technologies that data scientists use.

* TOC
{:toc}

## Microsoft Excel and Google Sheets
Data science is a broad field that involves collecting, cleaning, analyzing, and interpreting data to extract insights and make informed decisions. While coding is an essential aspect of data science, not all data science problems require programming skills. In some cases, simple calculations or analyses can be done using tools like Microsoft Excel or Google Sheets.

For instance, you can use Excel and Sheets to calculate basic statistical measures like mean, median, mode, and standard deviation and creating visualizations. Simple data wrangling is also possible---there are ways to remove nulls/duplicates and do feature engineering. Additionally, altering specific values in a table is easier in these technologies than in code.

Excel and Google Sheets can also be used to perform simple predictive analyses. For instance, you can use regression analysis to model the relationship between two variables and make predictions about the future based on the model. While this may not be as sophisticated as other coding alternatives, it can be useful in making simple predictions based on historical data.

Here is an [article](https://medium.com/analytics-vidhya/data-analysis-in-spreadsheets-8ffb1d6fe4db) that goes through how you can do data analysis with Google Sheets and [here](https://ankitanshu.medium.com/useful-excel-function-for-data-analysis-2772a36d6604) is one for Excel.
## Getting Started
Before writing any code, we need to choose a place to write the code. Integrated Development Environments (IDEs) are software applications that provide a comprehensive environment for developing and testing code. IDEs typically offer features such as code debugging, syntax highlighting, auto-completion, and version control, making them an ideal choice for software developers who need to work on large-scale projects. 
### Anaconda
A Jupyter Notebook is an open-source web application that allows users to create and share documents that contain live code, equations, visualizations, and narrative text. This tool is particularly useful for data scientists who need to combine code, data, and explanatory text in a single document. Jupyter Notebook supports multiple programming languages such as Python, R, and Julia, making it a versatile tool for data analysis.

An easy way to get set up a Jupyter Notebook is with [Anaconda](https://www.anaconda.com/products/distribution). Anaconda can be thought of as a suite of useful programs for writing code in Python and R; it comes with a large number of fundamental data science libraries and tools and provides a convenient way to install, manage, and update all the other essential libraries and dependencies that data scientists use.

### Google Colab
Another option is [Google Colab](https://colab.research.google.com/).  If you want to code in Python but don't want to install anything, then Google Colab is for you. Some benefits over Anaconda include: notebook sharing at the click of a button, access to Google's hardware resources for faster model training, and Git/Github integration. There's not much setup needed, just make sure you're logged into your Google account and start coding!

## Python
### Numpy
[NumPy](https://numpy.org/) is a Python library that provides support for large, multi-dimensional arrays and matrices, as well as a variety of mathematical functions to operate on these arrays. It is widely used in data science for data manipulation, numerical analysis, and scientific computing. NumPy provides a powerful and efficient way to work with large datasets, especially when they involve mathematical operations or linear algebra. NumPy is particularly useful for machine learning, as it provides a way to perform linear algebra operations on large matrices quickly and efficiently.

Some key functions of NumPy:
- easy linear algebra operations
- preprocessing data (normalizing, scaling)
- calculating statistics (faster, more built in functions, integration with other libraries)

### Pandas
[Pandas](https://pandas.pydata.org/docs/user_guide/index.html) is a popular open-source Python library and will be your best friend for data manipulation and analysis. It provides a fast, flexible, and efficient data structure for working with structured data. Pandas is widely used by data scientists for a number range of tasks, including data cleaning, data transformation, and data analysis. In fact, Pandas is built on top of NumPy, which makes for fast and efficient numerical operations.

In Pandas, a DataFrame is a two-dimensional labeled data structure with columns of potentially different types. You can think of them like a spreadsheet--they have rows and columns and values in each cell. By using Pandas to write code, we can have complete control over a dataframe and perform many granular tasks that are not possible in applications like Google Sheets or Excel.

A few basic Pandas functions:

1.  Easy Data Manipulation: DataFrames provide a convenient and efficient way to manipulate data, such as filtering, merging, grouping, and sorting. Pandas provides a wide range of functions to handle these operations, making data manipulation tasks faster and more efficient.
    
2.  Missing Data Handling: DataFrames can handle missing data values, which is a common issue in real-world datasets. Pandas provides several functions to detect, remove, or fill missing values, making it easier to clean and preprocess data.
    
3.  Data Visualization: Pandas provides integration with several visualization libraries, such as Matplotlib and Seaborn, to visualize and explore data in the DataFrame. This allows data scientists to quickly identify patterns and relationships in the data.
    
4.  Performance: Pandas is built on top of NumPy, which provides fast and efficient computations on arrays. This allows DataFrames to handle large datasets and perform complex operations quickly and efficiently.
    
5.  Integration: Pandas integrates well with other data science tools and libraries, such as scikit-learn, TensorFlow, and PyTorch. This makes it easier to integrate DataFrames into the broader data analysis and machine learning workflow.

Check out [this](https://towardsdatascience.com/pandas-dataframe-a-lightweight-intro-680e3a212b96) article to see some  common functions.
Here is a useful [cheatsheet](https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf) with a lot more functions!

### Matplotlib
[Matplotlib](https://matplotlib.org/stable/gallery/index) is a Python package used by data scientists to create quick, on-the-go visualizations of their data. Matplotlib provides a range of customizable plots, including line plots, scatter plots, bar plots, and histograms, among others. It also offers a range of customization options, allowing users to adjust everything from axis labels to colors and fonts. It integrates well with other popular data science packages in Python, such as NumPy and Pandas. This allows them to easily create visualizations of their data when doing EDA.

Check out [this](https://towardsdatascience.com/matplotlib-cheat-sheet-f441c43971c4) beginner-friendly article about matplotlib and a figure's anatomy.

### Seaborn/Plotly
[Seaborn](https://seaborn.pydata.org/tutorial/introduction.html) and [Plotly](https://plotly.com/python/getting-started/) are two more powerful visualization tools used in data science to create more "final-product-y" and interactive graphs and charts. While Matplotlib is a great base plotting library, Seaborn and Plotly take it to the next level by providing more advanced features and improved aesthetics.

Seaborn is known for its ability to create aesthetically pleasing static visualizations with minimal coding, making it a popular choice for creating dashboards after doing the actual analysis and etc. It provides default color palettes and styles that can be easily customized to fit the specific needs of the user, and overall a more polished finish to the plots it produces.

Another popular option for more "final-product-y" graphs is Plotly, a library that allows users to create interactive web-based visualizations in Python. Plotly's interactive features are its main selling point, they allow users to zoom, pan, and hover over data points to see their values. This can be especially useful when dealing with large datasets, as it allows users to explore the data in more detail. Plotly also allows users to create 3D visualizations and animations, which can be useful in certain applications. 

### Scikit-learn
[Scikit-learn](https://scikit-learn.org/stable/tutorial/basic/tutorial.html), also known as sklearn, is a machine learning library for Python. It is built on top of NumPy, SciPy, and matplotlib, and provides a wide range of tools for different tasks related to machine learning, such as classification, regression, clustering, dimensionality reduction, model selection, and preprocessing. Just to name some, linear and logistic regression, support vector machines, decision trees, random forests, and k-means clustering are all included in sklearn and can be implemented in just several lines of code. 

In addition to the models, scikit-learn offers a variety of methods and tools for data preprocessing, model selection, and pipelines. For instance, data normalization, scaling, encoding categorical features, imputing missing values, and feature selection are among the preprocessing tools available. Model selection and hyperparameter tuning can be performed using cross-validation, grid search, and randomized search methods. Additionally, the pipeline class enables the chaining of multiple preprocessing and modeling steps into a single object.

## SQL
Structured Query Language (SQL) is a powerful and widely used programming language for managing relational databases. SQL allows users to create, modify, and retrieve data from large databases. It is important because sometimes you will not just be given a csv file with all the correct data to analyze, but you will be given access to a database and will have to produce the data yourself.

SQL allows data scientists to query data sets, filter data, and join tables to create new data sets. SQL also allows data scientists to aggregate data and calculate summary statistics--sounds a little like Pandas right? So what's the difference?

SQL is designed to work with large databases, and it can handle millions of records and terabytes of data. Handling this amount of data with Pandas, would be slow and troublesome.

However, SQL can be limited when it comes to data cleaning and transformation as it does not have built-in functions for data cleaning or transformation like Pandas does. In addition, SQL is not ideal for complex statistical analysis or machine learning.

## Kaggle and Google Dataset Search 
[Kaggle](https://www.kaggle.com/) is a platform for data scientists to find and participate in machine learning competitions, collaborate on data science projects, and learn from other data scientists. 

The most appealing part of Kaggle is that it hosts a large collection of datasets that can be used for research and analysis. These datasets cover a wide range of topics, from healthcare, finance, and social sciences to video games, zebra crossings, and mushroom attributes. The idea is that this library gives you a playground to practice your skills in.

[Google Dataset Search](https://datasetsearch.research.google.com/) is an alternative, it looks for datasets across the entire internet (including kaggle), so if you're looking for something niche then GDS may be worth looking at. It is primarily a search engine for datasets, while Kaggle is more of a community and platform for data scientists that includes a bunch of downloadable datasets.
