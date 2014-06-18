#The Code Book:

##1. Data Source:

The source of the data is the UCI Machine Learning Repository
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

###1.1 Abstract
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.


###1.2 Details:
Details of the experiments are copied from the original README from the experiment.

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. "

##2. Study Design:

The purpose of this "study" is the tidy up the data from the data source to make for an easier to analyze dataset. The thesis is that tidy data will be useable for analyzing how sensors react to different activities making it possible to predict what activity a person is doing based solely on sensor data through statistical analysis and/or machine learning.

* The source data was read in an R script and combined into one data frame. (source data in this case was x_test.txt, y_test.txt, subject_test.txt, features.txt, x_train.txt, y_train.txt and subject_train.txt)
* Then the data was formatted, numeric variables for activities were changed to more descriptive character variables.
* Column names were added
* Unnnecessary columns were removed (columns not containing mean or standard devation for the sensor data)
* The data was then tidied up with 3 nested for loops and inserted in to a new data frame (called df)
* This data frame had column names readded, it was ordered and row names were removed.



##3. Code Book:

###3.1 Variables:
The variables are described by the column number they occur in

* 1 "ID" - This is a numeric variable contaning the ID of the study participant, there are 30 participants total
* 2 "Activity" - in the study the participants performed 6 different activities which were measured with a Samsung Galaxy SII, the activity variable is a character variable which details which activity was measured in the coming variables
* 3-81 "means of measurements" - The accelerometer and gyrometer data for every participant, every direction and every activity they did. these variables contain the means of different measurements by the gyroscope and accelerometer in different directions. The names of the variables will define whether it's the mean or the mean of the standard deviation of a measured acceleration, G-force or something else.

**List of the different varaibles from the last 78 columns:**
**Note however that there are mean and std versions of all these variables and that they are are split into X,Y and Z variables**
- BodyAcc-XYZ
- ravityAcc-XYZ
- odyAccJerk-XYZ
- odyGyro-XYZ
- odyGyroJerk-XYZ
- odyAccMag
- ravityAccMag
- odyAccJerkMag
- odyGyroMag
- odyGyroJerkMag
- odyAcc-XYZ
- odyAccJerk-XYZ
- odyGyro-XYZ
- odyAccMag
- odyAccJerkMag
- odyGyroMag
- odyGyroJerkMag

The thesis is that variables 3-81 can be compared to the activities and hopefully with statistical modelling we can find out how the gyroscope and accelerometer react to different activities so we can predict those activities with hardware.

###3.2 Units:
For Units see section 1.2
