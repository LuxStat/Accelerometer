## Course Project
# The tasks to be carried out in the course project
# (based on the accelerometer datasets described under ImportMerge below)
# are  the following: 
# 0. (not enumerated in the assignment): Import the data
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 6 (not enumerated in the assignment): Export the data


importMerge<-function(){
# The function imoortMerge imports the accelerometer datasets
# (described on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
# and thereafter merges the various imported data frames into one large data set, adding descriptive information
# and returns this merged data set 
####  
# The function is "hard coded", purpose written for this exercise.
# The reason for packaging all this in a function (although no parameters are supplied) is to 
# prevent the working environment from being littered with intermediate data sets 
####
# A prerequisite for running this function is that the data have already been downloaded 
# from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# to:   the "data" subdirectory of the working directory
# (This has been done "manually", since the .zip file resulting from download.file was corrupt)  
####
# This corresponds to tasks 1, 3 and 4 of the course project. 
# NOTE: The tasks are not executed in the order they were given in the assignment. 
# The comments are arranged to the assignment tasks, though.
# NOTE: As a first step (0), importing of data takes place 
  
######################## (0) Importing data #######################

######################## (0a) Importing information common to the test and training data 

# Import the measure IDs and labels
fileName<-".\\data\\features.txt"
MeasureKey<-read.table(fileName)

# Import activity IDs and labels
fileName<-".\\data\\activity_labels.txt"
ActivityKey<-read.table(fileName)

######################## (0b) Importing training data (from the train subdirectory) 

# Import subject IDs - training data set
fileName<-".\\data\\train\\subject_train.txt"
SubjectsTrain <- read.table(fileName)

# Import measures  - training data set
fileName<-".\\data\\train\\X_train.txt"
MeasuresTrain <- read.table(fileName)

# Import activity IDs - training data set
fileName<-".\\data\\train\\y_train.txt"
ActivitiesTrain <- read.table(fileName)

######################## (0c) Importing test data (from the test subdirectory) 

# Import subject IDs - training data set
fileName<-".\\data\\test\\subject_test.txt"
SubjectsTest <- read.table(fileName)

# Import measures  - training data set
fileName<-".\\data\\test\\X_test.txt"
MeasuresTest <- read.table(fileName)

# Import activity IDs - training data set
fileName<-".\\data\\test\\y_test.txt"
ActivitiesTest <- read.table(fileName)

######################## (4) Descriptive labelling of variables #########################################################

## (4a) The vector with the 561 different measures are stored in the 2nd column of MeasureKey
## Then we name the columns of the two measure data frames using these labels
MeasureLabels<-as.vector((MeasureKey$V2))
colnames(MeasuresTrain)<-MeasureLabels
colnames(MeasuresTest)<-MeasureLabels

##(4b) Rename the column names related to activities
colnames(ActivityKey) <- c("ActivityID","ActivityType")
colnames(ActivitiesTrain) <- "ActivityID"
colnames(ActivitiesTest) <- "ActivityID"

## (4c) Rename the column names related to subjects
colnames(SubjectsTrain) <-"Subject"
colnames(SubjectsTest) <-"Subject"

# (1) Merging of the six datasets containing measures, activities and subjects

# (1a) Merging of the training data sets
# Since there is no key linking together the training data sets, but they have equal length,  
# they are merged by means of cbind (operating under the assumption that they have identical order!)
  DataTrain<-cbind(MeasuresTrain,ActivitiesTrain,SubjectsTrain)

# (1b) Merging of the test data sets
# Since there is no key linking together the test data sets, but they have equal length,  
# they are merged by means of cbind (operating under the assumption that they have identical order!)
  DataTest<-cbind(MeasuresTest,ActivitiesTest,SubjectsTest)

# (1c) Concatenation of the test and training data sets
# The training and test data sets are concatenated by means of rbind
  DataTT<-rbind(DataTrain,DataTest)

# (3) Appropriate labelling of activities
# The activity labels are added to the concatenated data set
  DataTTlabelled<-merge(x=ActivityKey,y=DataTT,by.x="ActivityID",by.y="ActivityID")

# The merged data set is returned
 return(DataTTlabelled)
}

subsetMeanStd<-function(FullData){
# This function carries out task 2 of the assignment, i.e. extracting only means and standard deviations
# The sole parameter of the function is the full data frame (including all measurements and identifiers)

# (2a) the variable names are extracted from the data frame
  variableNames<-colnames(FullData)
# (2b) the identifier variables "Subject" and "Activity" are identified 
  SubjectBoole<-grepl("Subject",variableNames)
  ActivityBoole<-grepl("ActivityType",variableNames)
# (2c) the variables with names including the substrings "mean" and "std" are identified 
  MeanBoole<-grepl("mean",variableNames)
  StdBoole<-grepl("std",variableNames)
# (2d) the variable names including the substring "meanFreq" (NOT in scope) are identified 
  MeanFreqBoole<-grepl("meanFreq",variableNames)
# (2e) The variables in scope (the union of 2b and 2c) are flagged for retention
# and the variables out of scope (2d) are flagged for deletion 
  MeanStdBoole<-((SubjectBoole|ActivityBoole|MeanBoole|StdBoole) & !MeanFreqBoole)
# (2f) The subset of FullData containing the chosen variables are returned    
  return(FullData[,MeanStdBoole])
}

averageData<-function(DisaggregatedData){
# This function corresponds to the task 5 of the assignment: taking means per subject and activity

# (5a) the variable names are extracted from the data frame
  variableNames<-colnames(DisaggregatedData)
# (5b) the grouping variables "Subject" and "ActivityType" are identified 
  SubjectBoole<-grepl("Subject",variableNames)
  ActivityBoole<-grepl("ActivityType",variableNames)
# (5c) the measures, i.e. all variable names EXCEPT the grouping variables are retained.
  ChosenMeasures<-variableNames[!(SubjectBoole|ActivityBoole)]

# (5d) To facilitate the taking of averages, the data are reshaped by melting them, 
# so that all measures are in a single column ("value"), 
# with (for each subject and activity) one row per variable
  library(reshape2)
  DataMelt <- melt(DisaggregatedData,id=c("ActivityType","Subject"),measure.vars=ChosenMeasures)

# (5e) The averages are taken by means of the aggregate function
  groupvars<-list(DataMelt$ActivityType, DataMelt$Subject, DataMelt$variable)
  aggregatedData<-aggregate(x=DataMelt$value, by=groupvars, FUN="mean")
  colnames(aggregatedData)<-c("Activity", "Subject", "Measure","Average")

# (5f) Finally, the data are tidied up by recasting them so that each measure is presented in a separate column
  tidyData<-dcast(data=aggregatedData,formula=Activity + Subject ~ Measure,value.var="Average")

# (5g) The tidy data frame is returned
  return(tidyData)
}

# The functions corresponding to the assignment tasks are called

# Tasks 1, 3 and 4
FullAccelerometerData  <-importMerge()

# Task 2
AccelerometerSubset<-subsetMeanStd(FullAccelerometerData)

# Task 5
AccelerometerAverages<-averageData(AccelerometerSubset)

# Task 6
write.table(x=AccelerometerAverages,file=".\\data\\accelerometerAverages.txt",row.name=FALSE) 

