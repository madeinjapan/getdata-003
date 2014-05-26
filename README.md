# Getting and Cleaning Data Course Project

This is a Course Project for Getting and Cleaning Data course by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD.

The project consists of two files:

*CodeBook.md* — describes the variables, the data, and any transformations and work that was performed to clean up the data.

*run_analysis.R* — script that performs the following analysis:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## How to run the script

1. Check-out the run_analysis.R
2. Start the R environment and set the working dir to the one containing Samsung UCI HAR Dataset using the setwd() function
3. Run the run_analysis.R source

The script would then produce the tidyDataset.csv file in the working dir containing the tidy dataset described in the code book.