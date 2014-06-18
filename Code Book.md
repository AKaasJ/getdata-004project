#The Code Book:
##Data Source:
The source of the data is the UCI Machine Learning Repository
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

**Abstract:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

##Study Design:

The purpose of this "study" is the tidy up the data from the data source to make for an easier to analyze dataset. The thesis is that tidy data will be useable for analyzing how sensors react to different activities making it possible to predict what activity a person is doing based solely on sensor data through statistical analysis and/or machine learning.

* The source data was read in an R script and combined into one data frame. (source data in this case was x_test.txt, y_test.txt, subject_test.txt, features.txt, x_train.txt, y_train.txt and subject_train.txt)
* Then the data was formatted, numeric variables for activities were changed to more descriptive character variables.
* Column names were added
* Unnnecessary columns were removed (columns not containing mean or standard devation for the sensor data)
* The data was then tidied up with 3 nested for loops and inserted in to a new data frame (called df)
* This data frame had column names readded, it was ordered and row names were removed.



##Code Book:
###Variables:

The variables are described by the column number they occur in

* 1 "ID" - This is a numeric variable contaning the ID of the study participant, there are 30 participants total
* 2 "Activity" - in the study the participants performed 6 different activities which were measured with a Samsung Galaxy SII, the activity variable is a character variable which details which activity was measured in the coming variables
* 3-81 "means of measurements" - The accelerometer and gyrometer data for every participant, every direction and every activity they did. these variables contain the means of different measurements by the gyroscope and accelerometer in different directions. The names of the variables will define whether it's the mean or the mean of the standard deviation of a measured acceleration, G-force or something else.

The thesis is that variables 3-81 can be compared to the activities and hopefully with statistical modelling we can find out how the gyroscope and accelerometer react to different activities so we can predict those activities with hardware.
