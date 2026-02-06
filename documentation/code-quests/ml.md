---
layout: default
title: Machine Learning
parent: Code Quests
nav_order: 5 # Order under the "Coding Quests" section
permalink: /docs/code-quests/ml/
---

# Machine Learning Main Quest: Coming Soon

Machine learning is a system or branch of Artificial Intelligence within Computer Science that focuses on teaching computers to make predictions, create descriptions, and prescribe certain methods of action without being explicitly told to do so (The computer in a way is being trained by means of analyzing historical data to act on its own). Some examples of machine learning algorithms include Neural Networks (models inspired by the human brain that analyze data via layers of linked nodes), Clustering (grouping data points together based on similar characteristics), and Decision Trees (models that split data into branches based on decision rules to reach a prediction or classification).

### Level One: 
→ Instructions shown below.
### Level Two: 
→ A beginner machine-learning challenge for practicing model building and evaluation on a real-world dataset.You can accept the assignment [<u>here</u>](https://classroom.github.com/a/pjAJqyVR). 
### Level Three: 
→ Creating your own project. The instructions can be found [<u>here</u>](https://github.com/BU-Spark-Learning-Ambassadors/ML-level-3).

---
# Machine Learning (Regresssion) Level One
## Overview – what you should learn  

### Vocabulary  

- Algorithm

- Model

- Test Data

- Training Data

- Linear, Multiple Linear, and Polynomial Regression

- Supervised ML

- Unsupervised ML

- R-Squared and Adjusted R-Squared

- Parameters vs Variables

- Root Mean-Squared Error

- Overfitting

- Multicollinearity

- Regularization

### **Key Functions of Machine Learning (ML) Algorithms and Models:**

- **Descriptive:** An ML algorithm focused on understanding, describing,
  and recognizing patterns or relationships in past/historical data. The
  output typically exists in the form of data summaries by means of
  charts, tables, and graphs that are able to describe key features and
  frequencies noticed in the data set. Common techniques include
  clustering and dimensionality reduction analysis, and a potential
  example could be using machine learning to help advertising firms
  understand which forms of media lead to the great viewership among
  consumers.

- **Predictive:** This form of ML analytics revolves around using
  historical data to make predictions or forecast future possibilities,
  behaviors, or relationships among your variables. Two of the most
  common applications of predictive analytics include ML Regression and
  Decision Trees, which can be used to predict stock market movements
  and give personalized recommendations to users of streaming services.
  The output of such a technique include probability scores of a certain
  event’s chance or an estimated value.

- **Prescriptive:** Prescriptive analytics blends both predictive and
  descriptive ML together to create a system that allows us to not only
  forecast future outcomes but also understand the steps we should take
  in order to create a certain successful outcome. The output is a
  recommended strategy or action and an example of this is how data
  scientists can use optimization algorithms to understand how best to
  set up their spends across advertising campaigns with various forms of
  media in order to get the best results.

### **Questions You’ll Be Able to Answer:**

- What are Machine Learning (ML) and Regression?

- What are the softwares and the prerequisite python understanding I
  require?

- What are the steps to using ML and what is the process in which it
  functions?

- How do I train and evaluate the effectiveness of ML Models?

- What key metrics allow me to evaluate ML models

- What are some drawbacks of Machine learning?

- What are real world applications of ML?

> **Algorithm —** In anything from mathematics to computer science, an
> algorithm refers to any set of instructions that are completed in a
> certain order to attain a particular goal/result. Algorithms are the
> main building blocks of machine learning models as they take in inputs
> and then run them through an ordered series of steps to classify data
> or make predictions.
>
> <span class="mark">**Model —** A program that uses multiple algorithms
> to identify patterns in data and then create prescriptions,
> descriptions, or predictions based on the nature of our system. A
> model is, essentially, the final result when you combine an ML
> algorithm with data.</span>
>
> <span class="mark">**Training Data —** The first subset of your data
> that is used to teach the model, enabling it to find patterns and
> relationships between variables and identify certain parameters on its
> own. The overall goal of training data is to provide the model with
> examples of correlations between independent and dependent variables,
> so that the model can just adjust various parameters to maximize
> predictive efficiency. A common practice is to allocate around 60-80%
> of your total data for training, with the remaining 20-40% split
> between validation and testing. The larger the training set, the
> better the model can learn from the data.</span>
>
> <span class="mark">**Testing Data** — A subset of data that is used to
> evaluate the performance of a trained machine learning model. Unlike
> training data, which the model learns from, testing data is new and
> unseen by the model during training. It allows us to assess how well
> the model generalizes to new, real-world data, providing an indication
> of its accuracy and effectiveness in making prediction</span>
>
> <span class="mark">**Validation Data** — A separate subset of data
> used during model training to fine-tune the model and prevent
> overfitting. It helps in adjusting the model’s hyperparameters and
> determining when to stop training, ensuring that the model performs
> well not only on the training data but also on unseen data. Validation
> data provides an intermediate evaluation between training and
> testing.</span>
>
> <span class="mark">**Linear, Multiple, and Polynomial Regression —**
> Mathematical models and applications of ML used to understand the
> nature of the relationship between the variables being studied. Linear
> models involve fitting the relationship between a single independent
> variable and single dependent variable on a straight line, multiple
> regression models extend this to fit the relationship between many
> independent variables and a single dependent variable on a straight
> line. Polynomial regression models fit the relationship between our
> data on a curve to show more complex and non-linear
> relationships.</span>
>
> <span class="mark">**Supervised Machine Learning —** The process of
> training a model on a data set that has labels and where every input
> is matched to some sort of output. The model learns to map inputs to
> outputs by reducing the gap between its predictions and the actual
> labels during training. Once trained, the model can predict outcomes
> for new, previously unseen data using the patterns acquired from
> labeled instances. E.g. A model can be trained to predict a house's
> price based on data about the house, such as its square footage,
> number of rooms, and features, and its price.</span>
>
> **<span class="mark">Classification -</span>**
>
> <span class="mark">**Classification and Regression —** Both are types
> of machine learning tasks, but they serve different purposes.
> Classification involves assigning data points to predefined categories
> or classes based on input features, such as identifying if an email is
> "spam" or "not spam." It is used when the output is categorical. In
> contrast, Regression is used to predict continuous numerical values,
> such as estimating house prices or predicting temperatures. While
> classification outputs discrete labels, regression deals with
> predicting a range of possible numerical outcomes.</span>
>
> <span class="mark">**Unsupervised Machine Learning —** Training a
> model on a data set that does not have any labeled outputs, thereby,
> prompting the model to act on its own and discover structures within
> the data. An example is clustering where data is sorted into clusters
> based on commonalities. For example, when evaluating customer data,
> clustering may assign all women to one group and all males to
> another.</span>
>
> <span class="mark">**R-Squared and Adjusted R-Squared —** Known as the
> coefficient of determination, it’s a metric that is used to determine
> the effectiveness of your trained Machine Learning model. It assesses
> how well the model fits the data by calculating the fraction of
> variation in the dependent variable that can be explained by
> independent variables. Adjusted R-Squared adjusts the number for the
> amount of independent variables we have, therefore, telling us if
> increasing or decreasing the amount of variables allows us to increase
> our power. The higher the r-squared value the better.</span>
>
> <span class="mark">**Parameters vs Variables —** ​​Variables in machine
> learning are the characteristics or inputs used to create predictions,
> which reflect the data properties analyzed by the model. Parameters,
> on the other hand, are internal model variables learned during
> training, such as neural network weights or regression model
> coefficients.</span>
>
> <span class="mark">**Root Mean Squared Error (RMSE) —** Metric that
> assesses the accuracy of a regression model by taking the square root
> of the average squared differences between predicted and actual
> values. It indicates how far the predictions deviate from the real
> values on average, with lower RMSE suggesting better model
> performance.</span>
>
> <span class="mark">**Overfitting —** A bias or problem that could
> occur where your ML model uses the training data too greatly, causing
> it to focus too much on specific patterns that aren’t part of the new,
> unseen data it could take in. This causes poor performance on the test
> data and can be improved by simplifying your model or through
> regularization.</span>
>
> <span class="mark">**Multicollinearity —** When two or more
> independent variables in a regression model are significantly
> connected, resulting in predictive redundancy. This might result in
> incorrect coefficient estimates and exaggerated standard errors,
> making it impossible to determine the individual influence of each
> predictor.</span>
>
> <span class="mark">**Regularization —** Regularization is a strategy
> for preventing overfitting in machine learning models that involves
> penalizing the model's complexity. It prevents the model from fitting
> the training data too closely by limiting or regularizing the size of
> the model's parameters.</span>

###  

### What are Machine Learning and Regression?

**Machine learning** is a system or branch of Artificial Intelligence
within Computer Science that focuses on teaching computers to make
predictions, create descriptions, and prescribe certain methods of
action without being explicitly told to do so (The computer in a way is
being trained by means of analyzing historical data to act on its own).
Some examples of machine learning algorithms include Neural Networks
(models inspired by the human brain that analyze data via layers of
linked nodes), Clustering (grouping data points together based on
similar characteristics), and Decision Trees (models that split data
into branches based on decision rules to reach a prediction or
classification).

**Regression** is another ML algorithm and will be the primary focus of
this guide; in its simplest form, regression, whether linear, multiple
linear, or polynomial, is a technique used to predict a continuous
outcome (such as a person's pay based on their experience) by
determining the link between the input data and the output. A simple
breakdown of the way regression works in ML is that you start off with
inputting data in the model through Python, such as hours studied as an
independent variable and exam scores as the dependent. From there, the
regression model is trained by analyzing the data and learning the
overall relationship between the hours studied and the exam scores
students receive. Once trained, the model can then predict students’
exam scores based on the amount of hours they studied.

### Why understand Regression in Machine Learning?

### Understanding regression as a Machine Learning algorithm has become increasing crucial not only for the purpose of excelling in a lot of the Data and Computer Science courses that BU has to offer, but also due to the fact that **such a field gives students the ability to assess and anticipate real-world data - a process becoming increasingly relevant in a variety of industries.** Whether in banking, economics, marketing, or technology, regression aids in data-driven decision-making, trend identification, and difficult issue resolution. **As more and more corporations begin to take a data and AI driven approach to operations and success analytics, knowing how to use regression enables students to properly evaluate data, make predictions, and obtain a competitive advantage in their jobs.** To further exemplify the importance of Regression, some amazing softwares out there that use it include Netflix (To predict user preferences and recommend movies or shows based on viewing history), Amazon (To forecast product demand, optimize inventory, and recommend products to customers), and Zillow (To estimate property values based on features like location, size, and recent sales data).

### Okay, what are the essentials?

**First,** to begin performing Regression analysis as an ML algorithm
through python, you do need a basic mathematical understanding of
descriptive statistics (parameters like mean, median, mode, standard
deviation, etc), correlation and covariance, and regression as a whole
(including the interpretation of coefficients, residuals, and
goodness-of-fit measures (like R-squared). The link
[<u>here</u>](https://www.geeksforgeeks.org/ml-linear-regression/) is a
great way to develop this understanding.

**Second,** you will need access to a Python development environment,
such as Jupyter Notebook, which would allow you to write and test python
code interactively. The link
[<u>here</u>](https://mas-dse.github.io/startup/anaconda-macosx-install/)
teaches you how to download and access a Jupyter notebook to begin
coding in Python. Google Colab can also work and you can access this
through google drive. Knowing how to use libraries like scikit-learn,
pandas, and numpy in Python will also be very helpful in implementing
regression models.

**Last**, you will need to learn how to download a data set from a
website like Kaggle as a “.csv” and then import it onto your Jupyter
notebook so you can then begin analyzing it. On this
[<u>link</u>](https://www.geeksforgeeks.org/how-to-download-kaggle-datasets-into-jupyter-notebook/),
use the second method they mention to manually download the data set and
import it.

###  

### LET'S GET STARTED!



First, let’s work on loading up our Jupyter Notebook through the
Anaconda Navigator and then creating a new Python Notebook. Post that,
you’ll be able to then name your newly created notebook and then import
the necessary libraries you need to not only load your data set but also
carry out analysis. This can be done as shown in the image below.

![Jupyter Notebook](media/image24.png){:style="width:399px; height:218px; display:inline-block;"}

![Jupyter Notebook](media/image25.png){:style="width:383px; height:113px; display:inline-block;"}


At this point, you’ll now be able to find a data set that can be
downloaded through Kaggle and then imported on to Jupyter Notebook by
just dragging it on to the main page and then utilizing the pandas
library to load the data set, read it, and describe it. Here, you may
also want to take additional steps in order to pre-process the data,
which consists of dropping missing values in the data set and converting
categorical variables into numbers if needed. In order to effectively do
this, I’d also recommend taking a look at our Level 1 Data Prep and
Visualization document.

![Describe](media/image26.png){:style="width:394px; height:309px; display:inline-block;"}


When selecting the variables you’d like to feature in your model, such
as the multiple x-variables and the singular y-variable or dependent
variable, it's essential to choose x-variables that are relevant and
likely to influence the y-variable. This can be done by analyzing the
data, looking for correlations, and understanding the domain knowledge
behind the dataset. In a regression model, understanding the effect of
various characteristics on house prices, for example, your y-variable
would be the house price, and the x-variables could include factors like
the number of bedrooms, square footage, and location. It’s important to
select variables that have a meaningful impact on the outcome, avoid
multicollinearity (highly correlated x-variables), and possibly use
feature selection methods like stepwise selection or Lasso regression to
identify the most significant predictors.

The next step would be splitting our data into training data and testing
data, which we defined the value of earlier. Typically, the data is
split with 70-80% allocated to training and 20-30% for testing. This
ensures the model has enough data to learn patterns while reserving
enough unseen data to evaluate its performance. You can easily split the
data using the train\_test\_split function from
sklearn.model\_selection, specifying the appropriate proportions.

After our data has been split, we’re just using the LinearRegression
command on the training data and then making predictions using the test
data. It is also a good habit to create a graph of our predictions, so
that it’s much easier to visualize our data when it comes to actually
talking about the efficiency of our model. If you followed the similar
steps to the image below, we should now have the completed model.

YOU’VE CREATED YOUR REGRESSION MODEL? WHAT NEXT?

Now that you’ve created your regression model, you have to take measures
to evaluate your model and understand how well it actually is performing
on that unseen, test data. In order to engage in this evaluation, we
primarily do three things: calculate our MSE or RMSE, which was
previously defined in the vocabulary section, calculate our R-Squared,
and compare our Actual Y-Variable with the Y-Variable we’ve predicted.

![Plot](media/image27.png){:style="width:513px; height:285px; display:inline-block;"}


**First**, when it comes to evaluating the MSE, we know that this is a
metric that calculates the average squared difference between the test
set's actual values and the model's projected values. The lower the MSE,
the better as it’s telling us that the model’s predictions are closer to
the actual values. We have to also calculate the square root of this MSE
to get RMSE in order to bring this error metric back to the same unit as
our target variable (which is dollars for the price of each house). For
instance, if RMSE is $10,000, you know that, on average, your
predictions are off by about $10,000. Our RMSE also accounts for factors
such as outliers in the dataset.

**Second**, we must also create a plot of our actual vs predicted data
as shown on the right. A visual representation of the model's
performance may be obtained by charting the test set's actual housing
prices versus the model's anticipated values.

Points in this figure should be around a 45-degree line, which
represents the point where actual and anticipated values coincide. A
large distribution of points suggests low prediction accuracy.

**Third**, we must go into calculating our R-Squared value in order to
evaluate our model as this will enable us to comprehend
<span class="mark">how well the model fits the data by calculating the
fraction of variation in the dependent variable (house prices) that can
be explained by our independent variables. In order to do this, you can
take additional calculations (r2 = r2\_score(y\_test, y\_pred)). An
R-squared value of 0.66 indicates that our model explains 66% of the
variance in the target variable (house prices, in this case) based on
the features you’ve included in the model. This can be improved by
accounting for different factors, which we’ll explore!</span>

### COOL! HOW CAN I NOW IMPROVE MY MODEL?

You’re asking the right questions! As good practice, you’re going to
want to explore some of the ways you can increase your r-squared score
and lower your RMSE. Three possible ways include the following:

- Explore Residuals: Investigate the residuals (the differences between
  actual and predicted values) to see if there are any patterns that
  your model isn’t capturing.

- Feature Engineering: Consider adding or transforming features that
  might better capture the factors influencing house prices.

- Model Complexity: Experiment with more complex models or
  regularization techniques to see if they improve the R-squared without
  overfitting.

Furthermore, you can also take advantage of the Ordinary Least Squares
method to improve your model, as this is a more complex type of
regression that allows for improved interpretability.


### Drawbacks/Limitations and Real Life Applications

While ML Regression algorithms are a great tool for the analysis of
continuous variables and predictive processes, they do have limitations
and drawbacks that ensure correlation in models will not lead to
causation. Regression models frequently include assumptions about a
linear connection, constant error variance (homoscedasticity), and
errors' independence. Violations of these assumptions might result in
biased or incorrect forecasts. Additionally, a strong correlation
between independent variables might destabilize model coefficients,
making them difficult to understand. For a lot of corporations, there is
also the issue of scalability, where large datasets or high-dimensional
data can make regression models computationally expensive and
time-consuming to train.

This all being said, Regression is still a very useful tool to have in
any student’s armory regardless of what major they are as it will always
be applicable in the more data-driven world we’re seeing in the modern
day. Whether it be in the housing market, where users may estimate
property values based on characteristics such as location and size
(allowing buyers and sellers to make more informed decisions) or
marketing analytics, where users could determine the impact of
advertising spend on sales and optimizes marketing tactics, Regression
is applicable to a wide range of careers; its success is just dependent
on careful model selection, evaluation, and feature engineering.

---

### HOW TO CONTINUE THIS MAIN QUEST?

Take the quiz [<u>here</u>](https://docs.google.com/forms/d/e/1FAIpQLSdaWV6sIpCZvopCa7RITIbr3L-EeKWyD10-rIqBXrf2n5qTRg/viewform?usp=sf_link) to finalize level one, then apply your knowledge by doing a React Side Quest.

After completing that, you can move on to level three where you'll create your own project with some guidelines.

---

For any information or quality issues, please contact:

Kaylin Von Bergen  - [<u>kaylinvb@bu.edu</u>](mailto:kaylinvb@bu.edu)  

---

Author of this Code Quest:

Aarnav - [<u>aarnavp@bu.edu</u>](mailto:aarnavp@bu.edu)


