# Purpose
----
The main Purpose of this code is to obtain a tidy data set according to the requirements mentioned in the Course Project

## Usage 
---
* To run this code you should have extracted the samsung data in your working directory
* Here "UCI HAR Dataset" is used as the root folder
* Data can be obtained from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The activity_labels are matched with y_train and y_test using ids


## Output prints:
---
* The output is generated in "UCI HAR Dataset" directory as "TidyDataset.csv"
* The column names are in camel case for better understanding
* tbody,tgravity are changed to time domain body and time domain gravity
* fbody is changed to frequency domain body
* to further clear approach average has been used in column names since
these contains average of all the measurements grouped by subject and activity
This dataset has 180 rows and 68 columns
