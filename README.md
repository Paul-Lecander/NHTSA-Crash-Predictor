# **Group 3 Final Project - Segment 1**
## **Team: All Gas No Brakescd **
 - Paul Lecander
 - Bryce Hutchins
 - David Leske
 - Halil Dudakovic
 - Vincent Winting

## **Topic Overview**
The team will create an online resource/app that allows a user to input certain factors about a future road trip to understand the likelihood of being injured in a crash, should a crash occur, based on historical accident data. Statistics and data visuals will be generated to give a fuller context to the under-lying dataset.

## **Dataset**
The National Highway Traffic Safety Administration (NHTSA) publishes multi-year datasets with the goal of saving lives, reducing injuries and reducing the economic costs of road traffic crashes. The dataset looks at a sample of nationally representative crashes annually for the years 2018 through 2020. The data set highlights dozens of data points for each of the accidents reported via public police records about each accident.

Below are examples of the type of data that exist in the dataset.

### Accident Data
![Accident table](Resources/Sample%20Data%20-%20Accident%20Table.png)

### Vehicle Data
![Vehicle Table](Resources/Sample%20Data%20-%20Vehicle%20Table.png)

### Person Data
![Person Table](Resources/Sample%20Data%20-%20Person%20Table.png)


## **Exploratory Data Analysis**
Initial exploratory data analysis will generate hypotheses for the most important factors that increase the likelihood of an auto accident. We will leverage the datasets contained in the accident, driverrf, vehicle, and weather csv files to perform our EDA.

## **Database Design**
A relational Postgres database will be created for the project with 3 data tables.

Below is a sample of the tables and field names based on the example data above. Included in the figure are the fields which will be linked between tables.

![Table and Fields](Resources/Table%20and%20Fields.png)

Preliminary [tables create scripts](database/tables.sql) and a [select query](database/featuresQuery.sql) have also been provided.

## **Machine Learning Model**
Given the known binary outcome in the dataset, a deep neural network machine learning model will be created to classify whether a crash under specified conditions results in injury or not. Prior to running the model, the data will be preprocessed, including scaling using StandardScaler and encoding categorical data using OneHotEncoder. It is anticipated that three hidden layers will be used, with approximately 200, 40, and 10 nodes respectively. As a benchmark, a random forest classifier model will also be run.

## **Application**
A JavaScript web application will be built. The user will provide information about their upcoming trip. Upon submitting the form, the application will perform the algorithm that was identified by machine learning to determine if the user is likely to get injured, if they were to be involved in a car accident.


## **Segment 2 Presentation**
- [Presentation Slides](https://docs.google.com/presentation/d/1URjk4n8VrBYf9L2TYbccmTs8W7xYa4aCZMgLYnsPvqM/edit#slide=id.g12c84bcea79_0_43)