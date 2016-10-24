Variable Details
================

The script run_analysis.R carry a function to run 5 diffrent steps as described in course task list.
First part of function download zip file and place it in a directory after unzip. 

Here is different variables used in function for different purpose.

datar - source file location to download
destr -  destination of file downloaded
trainx - load train data from x_train file
trainy - load train data from y_train file
trainsub - load train data from subject_train file
train - combine all train data into one data frame

testx - load train data from x_test file
testy  - load train data from y_test file
testsub  - load train data from subject_test file
test- combine all test data into one data frame

compx - combine test & train data for x
compy - combine test & train data for y
compsub - combine test & train data for subject
compData - combine test & train data for all

features - Load feature.txt file
featurescol - reading all column values for details
featmeanstd - subset to contain standard dev and mean data 
featuresname - convert column values into column names

activityLabels - Load activity_labes.txt file
activityLabelscol - reading all column values for details

averages_data - subset to hold average based on activity and write to output file.

