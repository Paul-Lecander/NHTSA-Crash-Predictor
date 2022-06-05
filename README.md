# **Group 3 Final Project - Segment 1**
## **Team: All Gas No Brakes **
 - Paul Lecander
 - Bryce Hutchins
 - David Leske
 - Halil Dudakovic
 - Vincent Winting

## **Topic Overview**
On May 22, 2017, Dr. Jay Winton Tichelaar, was driving home from his workplace in Madison, Wisconsin to his home in Brookfield, about an hour away. It was a routine drive on interstate 94. His wife, Joleen, had dinner ready on the table and awaited his arrival. Jay never arrived home. About midway between work and home, Jay was following a semi-trailer when, without warning, the brake drum on the trailer shattered, sending a large fragment through Jay's windshield. The fragment struck Jay, taking his life from him.

That experience, now 5 years in the past, gave rise to the interest in the particular dataset used for this capstone project. The dataset comes from the National Highway Traffic Safety Administration (NHTSA, available at NHTSA.gov/data), and Jay's record is state record #550166 in the Fatality Analysis Reporting System (FARS), a related dataset. For this project, we selected two years of data from the Crash Report Sampling System (CRSS), which is a random sampling of the 5 to 6 million crashes that occur each year in the United States and is representative of all crashes that occur annually, not only fatal crashes. 

The purpose of the analysis is to determine the extent of an injury of an individual involved in a crash given particular pre-crash conditions. It is our hope that in some way, the exercise will also help raise motor safety awareness. 

The team will create an online resource/app that allows a user to input certain factors about a future road trip to understand the likelihood of being injured in a crash, should a crash occur, based on historical accident data. Statistics and data visuals will be generated to give a fuller context to the under-lying dataset.

## **Dataset**

The National Highway Traffic Safety Administration (NHTSA) publishes multi-year datasets with the goal of saving lives, reducing injuries and reducing the economic costs of road traffic crashes. The dataset looks at a sample of nationally representative crashes annually for the years 2019 and 2020. The data set highlights dozens of data points for each of the accidents reported via public police records about each accident.


Below are examples of the type of data that exist in the dataset.

### Accident Data
![Accident table](Resources/Sample%20Data%20-%20Accident%20Table.png)

### Vehicle Data
![Vehicle Table](Resources/Sample%20Data%20-%20Vehicle%20Table.png)

### Person Data
![Person Table](Resources/Sample%20Data%20-%20Person%20Table.png)


## **Exploratory Data Analysis**
Initial exploratory data analysis generated hypotheses for the most important factors that increase the likelihood of an auto accident. We leveraged the datasets contained in the accident, driver, vehicle, and weather csv files to perform our EDA.

## **Database Design**
A relational Postgres database has been created for the project with 3 data tables.

Below is a sample of the tables and field names based on the example data above. Included in the figure are the fields which are linked between tables.

![Table and Fields](Resources/Table%20and%20Fields.png)

Once the database design was finalized, we created the Postgres database in Amazon RDS. It is accessible to our Python machine learning scripts and web application. We have come up with a strategy and scripts for retrieving our data. For example, the Python scripts used with machine learning retrieves data with the accident_vehicle_person view. We've also defined a specific views for the web application to accident characteristics, such as accident numbers by age group. 

We will be making use of database views to return additional datasets for the application to visualize. Here are the various scripts currently available as part of the database:
1. Create tables - [tables.sql](database/tables.sql)
2. Accident/vehicle/person view - [accident_vehicle_person.view.sql](database/accident_vehicle_person.view.sql)
3. Chart for age counts view - [chart_age_counts.view.sql](database/chart_age_counts.view.sql)

## **Machine Learning Model**
Given the known binary outcome in the dataset, a deep neural network machine learning model was created to classify whether a crash under specified conditions results in injury or not. The dataset allows for classification of the extent of injury on an ordinal scale and therefore 3 separate models have been created based on the extent of the injury:

1. Any injury (minor, serious, or fatal)
2. Any serious injury (serious or fatal)
3. Any fatal injury

Prior to running the model, the data was preprocessed.  Fields from the selected data set were removed from the dataframe being used for machine learning if they were related only to post-accident outcomes and would not be expected to contribute to or be related to the severity of the injury as a result of the accident. For example, data on whether the person required transportation to the hospital was dropped as this data is a function of the extent of the injury rather than a contributing factor. The total number of features was 30 plus an additional 3 outcomes for a total of 33 variables.

Much of the data was categorical with many unique categories. Categorical data was binned to reduce the number of categories when the number of categories was larger.

For example, the following list: 

![Original](/Resources/body%20style-orig.png)

was bucketed to a much more manageable list: 

![Binned](/Resources/body%20style-binned.png)

In cases where the number of observations were low, categories were bucketed to further reduce the number of categories. For example, the number of occupants in a vehicle greater than 8 were all combined into a single category of 'more than 8'.

Categorical data was then transformed into numerical data using OneHotEncoder. Following encoding of categorical data, the dataset contained 129 features and the 3 outcome variables. 

Given the number of features and a dichotomous categorical outcome, the model of choice was a deep neural network. The neural network was designed with three hidden layers, with 300, 100, and 10 nodes respectively. The advantage of using the deep neural network is that the model is able to take a large number of features into account and determine their relationship one with another. The downside is that the exact relationship if each variable one to another is unknown, and therefore the importance of each variable in the outcome is unknown. Nevertheless, the purpose of our question is to determine given a set of conditions whether an individual would be injured in an accident, and the model is able to provide that particular outcome. 

The data was scaled using StandardScaler and split into testing and training datasets using the default settings. For the model related to any injury, the model was trained for 40 epochs to reduce potential overfitting. For the serious injury and fatal injury models, the model was trained for 35 and 25 epochs respectively. Below is the accuracy and loss for the training and test data for each data model.

| MODEL| Training Accuracy | Training Loss | Test Accuracy | Test Loss |
| :---: | :---: | :---: | :---: | :---: |
| Any Injury| 0.874 | 0.290 | 0.772 | 0.614 |
| Serious Injury| 0.981 | 0.055 | 0.934 | 0.269 |
| Fatal Injury| 0.998 | 0.007 | 0.989 | 0.059 |

## Benchmarking and Feature Importance
To benchmark the deep neural network machine learning model, a Random Forest Classifier model was also run on the same dataset. Results were similar between the two models.

Given the inability to determine importance of each of the features using the deep neural network model, feature importance was determined by the Random Forest Classifier model. The top 10 features across the 3 models were identified and are highlighted in the left column of our injury predictor dashboard, allowing end users to focus on the most important features while still allowing input on the less important features within the model.

## **Application**
A JavaScript web application has been built, allowing the user to provide information about their upcoming trip. Upon submitting the form, the application performs the algorithm that was identified by machine learning to determine if the user is likely to get injured, if they were to be involved in a car accident.

With Segment 2, we have made significant progress with our web application. Here are the highlights:
1. The application is running on the Heroku platform and available at the following URL: https://all-gas-no-brakes.herokuapp.com/
2. We have a separate repository for the web application where all of us are able to contribute: https://github.com/haldud/all-gas-no-brakes
3. We can make connections from our Node.js application hosted in Heroku to our PostgreSQL database hosted in AWS.
4. We started with the [SB Admin 2](https://startbootstrap.com/theme/sb-admin-2) template to make a visually appealing dashboard.
5. The Age Distribution chart on the [charts](https://all-gas-no-brakes.herokuapp.com/charts.html) page retrieves data from the database in real-time. Below are the code changes involved. We will follow a similar model for additional visualizations.
   - API to retrieve data from the DB: https://github.com/haldud/all-gas-no-brakes/blob/main/routes/cssr.js
   - Code to call the API and generate the age bar chart: https://github.com/haldud/all-gas-no-brakes/blob/main/public/js/age-bar-chart.js
6. Our plan is also to host the Tableau Data Visualizations that have been built with the use of iFrames.
7. We will next work on importing our models into the application, providing options for the user to enter fields, and finally running the model with the user provided data to determine the likelihood of injury.


## **Segment 2 Presentation**
- [Presentation Slides](https://docs.google.com/presentation/d/1URjk4n8VrBYf9L2TYbccmTs8W7xYa4aCZMgLYnsPvqM/edit#slide=id.g12c84bcea79_0_43)
- [Tableau Data Visualizations](https://public.tableau.com/app/profile/bryce.hutchins/viz/Final_project_16530196613110/Monthsbar)
