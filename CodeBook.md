# "Getting and Cleaning Data" Course Project Code Book

## Overview

The data produced by the script provided is a summarization of Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Study Design

The following steps were done to produce the summarization of Samsung UCI HAR Dataset data:

1. For both 'test' and 'train' data, the subjects, activity IDs and sensor measurements were merged into a single data sets
2. Both 'test' and 'train' data sets were modified dropping all the measurements except the mean and standard deviation ones
3. 'test' and 'train' data sets were then merged into a single dataset
4. The data set from the step 3 was modified by replacing the activity IDs with activity names based on the activity_labels.txt dictionary
5. Based on the dataset from step 4, a new data set with the average of each variable for each activity and each subject was created

## Code Book

*subject_id* — ID of a subject performing an activity, ranges from 1 to 30

*activity_name* — Name of an activity performed by a subject. The following values are possible:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

*Measurement variables* — the average of the mean and standard deviation measurements for the subject during the activity given
