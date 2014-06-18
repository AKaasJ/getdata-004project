getdata-004project
==================

My submission for the course project in the coursera course "Getting and Cleaning Data"

##How run_analysis.R works:

* The source data is read from your working directory which contains the source data (path given in the script: UCI HAR Dataset) The data is then combined into one data frame. called data (source data in this case was x_test.txt, y_test.txt, subject_test.txt, features.txt, x_train.txt, y_train.txt and subject_train.txt)
* Then the data is formatted, numeric variables for activities are changed to more descriptive character variables.
* Column names are added
* Unnnecessary columns are removed (columns not containing mean or standard devation for the sensor data)
* The data is then tidied up with 3 nested for loops and inserted in to a new data frame (called df)
* This data frame has column names readded, it is ordered and row names are removed.
* The resulting data frame is 180x81 containing the following columns: "ID", "Acitvity" and 79 columns of mean sensor measurements descriped in the column names
