accelerometerAverages.txt – CODE BOOK

This file describes the source data used as a basis for the file "accelerometerAverages.txt", describes the transformations that I have made, and lists the variables of the resulting data sets.

(I)	SOURCE DATA
The source data are the rather sophisticated accelerometer data, which were retrieved from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Since there is no simple way to summarise the source data, the reader is referred to the data description provided by the research team generating the source data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

(II)	TRANSFORMATIONS UNDERTAKEN(For a step-by-step description of the script, please refer to the "README.md" file)
After merging all test and training data, all measures not related to means and standard deviations are discarded, and averages of the remaining measures are taken within each combination of "Subject" and "Activity".
The resulting data set (180 rows - 6 activities times 30 subjects; 68 columns - 2 grouping variables + 66 measures) is stored in "accelerometerAverages.txt"

(III)	LIST OF VARIABLES
Please note that the 66 measurement variables are all averages across all measurements for the combination of activity and subject specified in “Activity” and “Subject”; the units for said measurements are provided in the source data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Variable:	Description
--------------------------------------------------------------------------------------------------------------------------------------
Activity:	One of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Subject: Sequential number of the subject (1-30)

tBodyAcc-mean()-X: Average (for all measures performed on the subjects) of the variable 'tBodyAcc-mean()-X'

tBodyAcc-mean()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyAcc-mean()-Y'

tBodyAcc-mean()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyAcc-mean()-Z'

tBodyAcc-std()-X: Average (for all measures performed on the subjects) of the variable 'tBodyAcc-std()-X'

tBodyAcc-std()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyAcc-std()-Y'

tBodyAcc-std()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyAcc-std()-Z'

tGravityAcc-mean()-X: Average (for all measures performed on the subjects) of the variable 'tGravityAcc-mean()-X'

tGravityAcc-mean()-Y: Average (for all measures performed on the subjects) of the variable 'tGravityAcc-mean()-Y'

tGravityAcc-mean()-Z: Average (for all measures performed on the subjects) of the variable 'tGravityAcc-mean()-Z'

tGravityAcc-std()-X: Average (for all measures performed on the subjects) of the variable 'tGravityAcc-std()-X'

tGravityAcc-std()-Y: Average (for all measures performed on the subjects) of the variable 'tGravityAcc-std()-Y'

tGravityAcc-std()-Z: Average (for all measures performed on the subjects) of the variable 'tGravityAcc-std()-Z'

tBodyAccJerk-mean()-X: Average (for all measures performed on the subjects) of the variable 'tBodyAccJerk-mean()-X'

tBodyAccJerk-mean()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyAccJerk-mean()-Y'

tBodyAccJerk-mean()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyAccJerk-mean()-Z'

tBodyAccJerk-std()-X: Average (for all measures performed on the subjects) of the variable 'tBodyAccJerk-std()-X'

tBodyAccJerk-std()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyAccJerk-std()-Y'

tBodyAccJerk-std()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyAccJerk-std()-Z'

tBodyGyro-mean()-X: Average (for all measures performed on the subjects) of the variable 'tBodyGyro-mean()-X'

tBodyGyro-mean()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyGyro-mean()-Y'

tBodyGyro-mean()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyGyro-mean()-Z'

tBodyGyro-std()-X: Average (for all measures performed on the subjects) of the variable 'tBodyGyro-std()-X'

tBodyGyro-std()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyGyro-std()-Y'

tBodyGyro-std()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyGyro-std()-Z'

tBodyGyroJerk-mean()-X: Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerk-mean()-X'

tBodyGyroJerk-mean()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerk-mean()-Y'

tBodyGyroJerk-mean()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerk-mean()-Z'

tBodyGyroJerk-std()-X: Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerk-std()-X'

tBodyGyroJerk-std()-Y: Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerk-std()-Y'

tBodyGyroJerk-std()-Z: Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerk-std()-Z'

tBodyAccMag-mean(): Average (for all measures performed on the subjects) of the variable 'tBodyAccMag-mean()'

tBodyAccMag-std(): Average (for all measures performed on the subjects) of the variable 'tBodyAccMag-std()'

tGravityAccMag-mean(): Average (for all measures performed on the subjects) of the variable 'tGravityAccMag-mean()'

tGravityAccMag-std(): Average (for all measures performed on the subjects) of the variable 'tGravityAccMag-std()'

tBodyAccJerkMag-mean(): Average (for all measures performed on the subjects) of the variable 'tBodyAccJerkMag-mean()'

tBodyAccJerkMag-std(): Average (for all measures performed on the subjects) of the variable 'tBodyAccJerkMag-std()'

tBodyGyroMag-mean(): Average (for all measures performed on the subjects) of the variable 'tBodyGyroMag-mean()'

tBodyGyroMag-std(): Average (for all measures performed on the subjects) of the variable 'tBodyGyroMag-std()'

tBodyGyroJerkMag-mean(): Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerkMag-mean()'

tBodyGyroJerkMag-std(): Average (for all measures performed on the subjects) of the variable 'tBodyGyroJerkMag-std()'

fBodyAcc-mean()-X: Average (for all measures performed on the subjects) of the variable 'fBodyAcc-mean()-X'

fBodyAcc-mean()-Y: Average (for all measures performed on the subjects) of the variable 'fBodyAcc-mean()-Y'

fBodyAcc-mean()-Z: Average (for all measures performed on the subjects) of the variable 'fBodyAcc-mean()-Z'

fBodyAcc-std()-X: Average (for all measures performed on the subjects) of the variable 'fBodyAcc-std()-X'

fBodyAcc-std()-Y: Average (for all measures performed on the subjects) of the variable 'fBodyAcc-std()-Y'

fBodyAcc-std()-Z: Average (for all measures performed on the subjects) of the variable 'fBodyAcc-std()-Z'

fBodyAccJerk-mean()-X: Average (for all measures performed on the subjects) of the variable 'fBodyAccJerk-mean()-X'

fBodyAccJerk-mean()-Y: Average (for all measures performed on the subjects) of the variable 'fBodyAccJerk-mean()-Y'

fBodyAccJerk-mean()-Z: Average (for all measures performed on the subjects) of the variable 'fBodyAccJerk-mean()-Z'

fBodyAccJerk-std()-X: Average (for all measures performed on the subjects) of the variable 'fBodyAccJerk-std()-X'

fBodyAccJerk-std()-Y: Average (for all measures performed on the subjects) of the variable 'fBodyAccJerk-std()-Y'

fBodyAccJerk-std()-Z: Average (for all measures performed on the subjects) of the variable 'fBodyAccJerk-std()-Z'

fBodyGyro-mean()-X: Average (for all measures performed on the subjects) of the variable 'fBodyGyro-mean()-X'

fBodyGyro-mean()-Y: Average (for all measures performed on the subjects) of the variable 'fBodyGyro-mean()-Y'

fBodyGyro-mean()-Z: Average (for all measures performed on the subjects) of the variable 'fBodyGyro-mean()-Z'

fBodyGyro-std()-X: Average (for all measures performed on the subjects) of the variable 'fBodyGyro-std()-X'

fBodyGyro-std()-Y: Average (for all measures performed on the subjects) of the variable 'fBodyGyro-std()-Y'

fBodyGyro-std()-Z: Average (for all measures performed on the subjects) of the variable 'fBodyGyro-std()-Z'

fBodyAccMag-mean(): Average (for all measures performed on the subjects) of the variable 'fBodyAccMag-mean()'

fBodyAccMag-std(): Average (for all measures performed on the subjects) of the variable 'fBodyAccMag-std()'

fBodyBodyAccJerkMag-mean(): Average (for all measures performed on the subjects) of the variable 'fBodyBodyAccJerkMag-mean()'

fBodyBodyAccJerkMag-std(): Average (for all measures performed on the subjects) of the variable 'fBodyBodyAccJerkMag-std()'

fBodyBodyGyroMag-mean(): Average (for all measures performed on the subjects) of the variable 'fBodyBodyGyroMag-mean()'

fBodyBodyGyroMag-std(): Average (for all measures performed on the subjects) of the variable 'fBodyBodyGyroMag-std()'

fBodyBodyGyroJerkMag-mean(): Average (for all measures performed on the subjects) of the variable 'fBodyBodyGyroJerkMag-mean()'

fBodyBodyGyroJerkMag-std(): Average (for all measures performed on the subjects) of the variable 'fBodyBodyGyroJerkMag-std()'
