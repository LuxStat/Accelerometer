This "README.md" file describes the operations performed on the source data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

in the script "run_analysis.R"

to arrive at the output data file "accelerometerAverages.txt"
(The content of the output data file is described in the code book "CodeBook.md".)

DESCRIPTION OF THE SCRIPT "run_analysis.R"

(For a fuller description, please refer to the comments in the script itself)

The following steps are undertaken in the following order (NOTE: enumerated according to the assignment, but presented in the order they are executed in the script "run_analysis.R"):
A. Function “importMerge” to import and merge data
Task 0. (not enumerated in the assignment): Import the data
Task 4. Appropriate labeling of the data set with descriptive variable names. 
-	The vector with the 561 different measure names is retrieved and used to name the columns of the two (test and training) measure data frames using these labels
-	The columns related to activities and subjects are renamed
Task 1. Merging of the training and the test sets into one data set.
-	Since there is no key linking together the training data sets, but they have equal length,  they are merged by means of cbind (operating under the assumption that record are ordered identically in the three data sets!)
-	Since there is no key linking together the test data sets, but they have equal length,  they are merged by means of cbind (operating under the assumption that record are ordered identically in the three data sets!)
-	The test and training data sets are concatenated
Task 3. Adding descriptive activity names to name the activities in the data set
-	The activity names are added by means of merging the small (2 columns/6 rows) activity code data set with the large test&training data set created in task 1
B. Function “subsetMeanStd” to limit the data set to means and standard deviations.
Task 2. Limiting the measurements to means and standard deviations:
-	The vector with column names is scanned (by grepl) to only include the grouping variable names (“Subject” and “ActivityType”) and the substrings “mean()” and “std()”
-	 The resulting Boolean variable is used to limit the number of columns
C. Function “averageData” to calculate averages for each combination of the grouping variables
Task 5. Creation of a tidy data set with the average of each variable for each activity and each subject.
-	The vector with measure names is obtained by excluding the grouping variables (“Subject” and “ActivityType”)
-	The melt function is applied to arrive at a long (>10000 rows) data sets with four columns (with the fourth column “value” column containing all measured values)
-	The average of “value” is taken for each combination of subject, activity and measure
-	The cast function is applied to arrive at a data set with 180 rows (6 activity types times 30 subjects) with one column for each measure containing the average (by subject and activity) for that measure.
D. Exporting
Task 6 (not enumerated in the assignment). The function write.table is used to export the data to the file accelerometerAverages.txt.
