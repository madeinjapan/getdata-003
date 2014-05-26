## The working dir must be set to the SAMSUMG data dir using setwd() function

library(reshape2)

## Read the activities table
activities <- read.csv("./activity_labels.txt", header=FALSE, sep="", col.names=c("activity_id", "activity_name"))

## Read the measurements names and create a logical vector indicating whether it's on the mean or standard deviation

features <- read.csv("./features.txt", header=FALSE, sep="")$V2
onlyMeanAndStdColumns <- grepl("mean()", features) | grepl("std()", features)

## Load X_text file and remove non-mean and non-std columns, then load subjects' ids and
## activities ids' and merge into the 'test' table

X_test <- read.csv("./test/X_test.txt", header=FALSE, sep="", col.names=features)
X_test <- X_test[,onlyMeanAndStdColumns]
y_test <- read.csv("./test/y_test.txt", header=FALSE, sep="", col.names=c("activity_id"))

subject_test <- read.csv("./test/subject_test.txt", header=FALSE, col.names=c("subject_id"))
test <- cbind(subject_test, y_test, X_test)
  
## Do the same with the train data, producing the 'train' table

X_train <- read.csv("./train/X_train.txt", header=FALSE, sep="", col.names=features)
X_train <- X_train[,onlyMeanAndStdColumns]
y_train <- read.csv("./train/y_train.txt", header=FALSE, sep="", col.names=c("activity_id"))

subject_train <- read.csv("./train/subject_train.txt", header=FALSE, col.names=c("subject_id"))
train <- cbind(subject_train, y_train, X_train)

## Merge the test and train data sets

dataset <- rbind(test, train)

## Merge the data set with activities table to get the activity name column and drop the activity_id column
  
dataset <- merge(dataset, activities)
dataset <- dataset[,!(names(dataset) %in% c("activity_id"))]

## Create a tidy dataset with the average of each variable for each activity and each subject

datasetMelt <- melt(dataset, id.vars=c("subject_id", "activity_name"))
tidyDataset <- dcast(datasetMelt, subject_id + activity_name ~ variable, fun.aggregate=mean)

## Write the tidy data set
write.csv(tidyDataset, file="tidyDataset.csv", row.names = FALSE)
