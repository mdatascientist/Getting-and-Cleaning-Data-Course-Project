
### CODEBOOK - GETTING AND CLEANING DATA PROJECT 2

#### PROJECT DESCRIPTION:
-	The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

#### PROJECT GOAL:
-	The goal is to prepare tidy data that can be used for later analysis. 

#### PROJECT REQUIREMENTS:
-	A tidy data set 
-	A link to a Github repository with your script for performing the analysis
-	A code book  (CodeBook.md) that 
    - Describes the variables
    - The data
    - Any transformations or work that you performed to clean up the data
-	A README.md file that explains how all of the scripts work and how they are connected.  

#### DEPENDENCIES:
-	DATA
	UCI HAR Dataset **(Human Activity Recognition Using Smartphones Data Set Version 1.0)**

	<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

 ![Alt UCI HAR dataset](https://github.com/mdatascientist/Getting-and-Cleaning-Data-Course-Project/blob/master/UCIHARDataset.png)

-	LIBRARIES

  library(dplyr)
  
  dplyr provides a flexible grammar of data manipulation. It's the next iteration of plyr,
  focussed on tools for working with data frames (hence the d in the name).


#### RUNNING THE ANALYSIS (TRANSFORMATIONS):

Create one R script called run_analysis.R that does the following

1. MERGE THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET

    -	Import the test data files (X_test & Y_test = 2947 rows)
    -	Rename Y_test column 1 to activity
    - Import the test subject file (subject_test)
    -	Rename subject_test column 1 to subject
    -	Import the train data files (X_train & Y_train = 7352 rows)
    -	Rename Y_train column 1 to activity
    - Import the train subject file (subject_train)
    -	Rename subject_train column 1 to subject
    -	Import the reference data files
    -	activity_labels.txt
    -	Rename column 1 to acitivity_id and column 2 to activity
    -	features.txt
    -	Rename column 1 to feature_id and column 2 to feature
<br><br>
2.	EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT.
    
    - Use grep to find the columns containing means and std.
    -	Temporarily extract the mean and standard deviation columns, will rename in STEP 4.  (I could have renamed all the columns here,  however that would negate the need for STEP 4).
<br><br>
3.	USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET

    -	Changes activity id appended earlier to descriptive label names
  
        - 1 = WALKING
        - 2 = WALKING_UPSTAIRS
        - 3 = WALKING_DOWNSTAIRS
        - 4 = SITTING
        - 5 = STANDING
        - 6 = LAYING
<br><br>
4. APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES.  

    - TAKEN FROM DISCUSSION FORUM: *David's very long and detailed project FAQ - Is step 4 the same as step 3*

    - *Since it say labels the data set it is talking about the variable names (which at the moment are V1, V2, etc....*

    -	Add the features column names to the tidy data output

        *NOTE: Remember that columns [562:563] contain the subject and activity*

5. FROM THE DATA SET IN STEP 4, CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT.

    -	Add Activity Id to datasets
    -	Average of each variable for each activity and each subject
    -	Order the activity column alphabetically

        *NOTE: Cannot use -[column name] for sorting as activity is a factor,*
    
    - used desc() to sort the activity description alphabetically, looks nicer!
    - Use semi-colon as separator as feature names contain commas, 

    e.g. tBodyAcc-arCoeff()-X,1 (the mean and std columns do not have this issue, however, if all the columns are used this would be appropriate) this can cause column heading issues if using the data in Excel,etc... remove row names (this creates and extra column at the beginning of the line)
    
    *NOTE: row.names = FALSE, otherwise an extra column is added to the beginning of the line*

    - Finally write the Very Tidy Data to a file (tidyData.csv)

#### TRANSFORMATIONS: TIDY DATA FILE TO ORIGINAL COLUMN NAMES FOR MEAN AND STANDARD DEVIATION: 

|	Source Table	|	Source Column	|	Descriptive Table Source	|	Descriptive Names	|
|	---	|	---	|	---	|	---	|
|	Y_test & Y_train	|	V1	|	activity_labels.txt	|	activity	|
|	subject_test & subject_train	|	V1	|	NA	|	subject	|
|	X_test & X_train	|	V1	|	features.txt	|	tBodyAcc-mean()-X	|
|	X_test & X_train	|	V2	|	features.txt	|	tBodyAcc-mean()-Y	|
|	X_test & X_train	|	V3	|	features.txt	|	tBodyAcc-mean()-Z	|
|	X_test & X_train	|	V4	|	features.txt	|	tBodyAcc-std()-X	|
|	X_test & X_train	|	V5	|	features.txt	|	tBodyAcc-std()-Y	|
|	X_test & X_train	|	V6	|	features.txt	|	tBodyAcc-std()-Z	|
|	X_test & X_train	|	V41	|	features.txt	|	tGravityAcc-mean()-X	|
|	X_test & X_train	|	V42	|	features.txt	|	tGravityAcc-mean()-Y	|
|	X_test & X_train	|	V43	|	features.txt	|	tGravityAcc-mean()-Z	|
|	X_test & X_train	|	V44	|	features.txt	|	tGravityAcc-std()-X	|
|	X_test & X_train	|	V45	|	features.txt	|	tGravityAcc-std()-Y	|
|	X_test & X_train	|	V46	|	features.txt	|	tGravityAcc-std()-Z	|
|	X_test & X_train	|	V81	|	features.txt	|	tBodyAccJerk-mean()-X	|
|	X_test & X_train	|	V82	|	features.txt	|	tBodyAccJerk-mean()-Y	|
|	X_test & X_train	|	V83	|	features.txt	|	tBodyAccJerk-mean()-Z	|
|	X_test & X_train	|	V84	|	features.txt	|	tBodyAccJerk-std()-X	|
|	X_test & X_train	|	V85	|	features.txt	|	tBodyAccJerk-std()-Y	|
|	X_test & X_train	|	V86	|	features.txt	|	tBodyAccJerk-std()-Z	|
|	X_test & X_train	|	V121	|	features.txt	|	tBodyGyro-mean()-X	|
|	X_test & X_train	|	V122	|	features.txt	|	tBodyGyro-mean()-Y	|
|	X_test & X_train	|	V123	|	features.txt	|	tBodyGyro-mean()-Z	|
|	X_test & X_train	|	V124	|	features.txt	|	tBodyGyro-std()-X	|
|	X_test & X_train	|	V125	|	features.txt	|	tBodyGyro-std()-Y	|
|	X_test & X_train	|	V126	|	features.txt	|	tBodyGyro-std()-Z	|
|	X_test & X_train	|	V161	|	features.txt	|	tBodyGyroJerk-mean()-X	|
|	X_test & X_train	|	V162	|	features.txt	|	tBodyGyroJerk-mean()-Y	|
|	X_test & X_train	|	V163	|	features.txt	|	tBodyGyroJerk-mean()-Z	|
|	X_test & X_train	|	V164	|	features.txt	|	tBodyGyroJerk-std()-X	|
|	X_test & X_train	|	V165	|	features.txt	|	tBodyGyroJerk-std()-Y	|
|	X_test & X_train	|	V166	|	features.txt	|	tBodyGyroJerk-std()-Z	|
|	X_test & X_train	|	V201	|	features.txt	|	tBodyAccMag-mean()	|
|	X_test & X_train	|	V202	|	features.txt	|	tBodyAccMag-std()	|
|	X_test & X_train	|	V214	|	features.txt	|	tGravityAccMag-mean()	|
|	X_test & X_train	|	V215	|	features.txt	|	tGravityAccMag-std()	|
|	X_test & X_train	|	V227	|	features.txt	|	tBodyAccJerkMag-mean()	|
|	X_test & X_train	|	V228	|	features.txt	|	tBodyAccJerkMag-std()	|
|	X_test & X_train	|	V240	|	features.txt	|	tBodyGyroMag-mean()	|
|	X_test & X_train	|	V241	|	features.txt	|	tBodyGyroMag-std()	|
|	X_test & X_train	|	V253	|	features.txt	|	tBodyGyroJerkMag-mean()	|
|	X_test & X_train	|	V254	|	features.txt	|	tBodyGyroJerkMag-std()	|
|	X_test & X_train	|	V266	|	features.txt	|	fBodyAcc-mean()-X	|
|	X_test & X_train	|	V267	|	features.txt	|	fBodyAcc-mean()-Y	|
|	X_test & X_train	|	V268	|	features.txt	|	fBodyAcc-mean()-Z	|
|	X_test & X_train	|	V269	|	features.txt	|	fBodyAcc-std()-X	|
|	X_test & X_train	|	V270	|	features.txt	|	fBodyAcc-std()-Y	|
|	X_test & X_train	|	V271	|	features.txt	|	fBodyAcc-std()-Z	|
|	X_test & X_train	|	V294	|	features.txt	|	fBodyAcc-meanFreq()-X	|
|	X_test & X_train	|	V295	|	features.txt	|	fBodyAcc-meanFreq()-Y	|
|	X_test & X_train	|	V296	|	features.txt	|	fBodyAcc-meanFreq()-Z	|
|	X_test & X_train	|	V345	|	features.txt	|	fBodyAccJerk-mean()-X	|
|	X_test & X_train	|	V346	|	features.txt	|	fBodyAccJerk-mean()-Y	|
|	X_test & X_train	|	V347	|	features.txt	|	fBodyAccJerk-mean()-Z	|
|	X_test & X_train	|	V348	|	features.txt	|	fBodyAccJerk-std()-X	|
|	X_test & X_train	|	V349	|	features.txt	|	fBodyAccJerk-std()-Y	|
|	X_test & X_train	|	V350	|	features.txt	|	fBodyAccJerk-std()-Z	|
|	X_test & X_train	|	V373	|	features.txt	|	fBodyAccJerk-meanFreq()-X	|
|	X_test & X_train	|	V374	|	features.txt	|	fBodyAccJerk-meanFreq()-Y	|
|	X_test & X_train	|	V375	|	features.txt	|	fBodyAccJerk-meanFreq()-Z	|
|	X_test & X_train	|	V424	|	features.txt	|	fBodyGyro-mean()-X	|
|	X_test & X_train	|	V425	|	features.txt	|	fBodyGyro-mean()-Y	|
|	X_test & X_train	|	V426	|	features.txt	|	fBodyGyro-mean()-Z	|
|	X_test & X_train	|	V427	|	features.txt	|	fBodyGyro-std()-X	|
|	X_test & X_train	|	V428	|	features.txt	|	fBodyGyro-std()-Y	|
|	X_test & X_train	|	V429	|	features.txt	|	fBodyGyro-std()-Z	|
|	X_test & X_train	|	V452	|	features.txt	|	fBodyGyro-meanFreq()-X	|
|	X_test & X_train	|	V453	|	features.txt	|	fBodyGyro-meanFreq()-Y	|
|	X_test & X_train	|	V454	|	features.txt	|	fBodyGyro-meanFreq()-Z	|
|	X_test & X_train	|	V503	|	features.txt	|	fBodyAccMag-mean()	|
|	X_test & X_train	|	V504	|	features.txt	|	fBodyAccMag-std()	|
|	X_test & X_train	|	V513	|	features.txt	|	fBodyAccMag-meanFreq()	|
|	X_test & X_train	|	V516	|	features.txt	|	fBodyBodyAccJerkMag-mean()	|
|	X_test & X_train	|	V517	|	features.txt	|	fBodyBodyAccJerkMag-std()	|
|	X_test & X_train	|	V526	|	features.txt	|	fBodyBodyAccJerkMag-meanFreq()	|
|	X_test & X_train	|	V529	|	features.txt	|	fBodyBodyGyroMag-mean()	|
|	X_test & X_train	|	V530	|	features.txt	|	fBodyBodyGyroMag-std()	|
|	X_test & X_train	|	V539	|	features.txt	|	fBodyBodyGyroMag-meanFreq()	|
|	X_test & X_train	|	V542	|	features.txt	|	fBodyBodyGyroJerkMag-mean()	|
|	X_test & X_train	|	V543	|	features.txt	|	fBodyBodyGyroJerkMag-std()	|
|	X_test & X_train	|	V552	|	features.txt	|	fBodyBodyGyroJerkMag-meanFreq()	|
|	X_test & X_train	|	V555	|	features.txt	|	angle(tBodyAccMean,gravity)	|
|	X_test & X_train	|	V556	|	features.txt	|	angle(tBodyAccJerkMean),gravityMean)	|
|	X_test & X_train	|	V557	|	features.txt	|	angle(tBodyGyroMean,gravityMean)	|
|	X_test & X_train	|	V558	|	features.txt	|	angle(tBodyGyroJerkMean,gravityMean)	|
|	X_test & X_train	|	V559	|	features.txt	|	angle(X,gravityMean)	|
|	X_test & X_train	|	V560	|	features.txt	|	angle(Y,gravityMean)	|
|	X_test & X_train	|	V561	|	features.txt	|	angle(Z,gravityMean)	|


#### ADDITIONAL COLUMN INFO: 

- X_test + Y_test + subject_test --> measurements + activity id + subject id

- X_train + Y_train + subject_train --> measurements + activity id + subject id

- activity id --> maps to reference table activity_labels (col1 = id, col2 = description)

- subject id --> no subject (Person) descriptions are available, the participants in the study are identified by a number only

- X-test and X_train --> columns name [V1...V561] 
    map to features (col1 = id, col2 = feature) *** Used to name columns
    Never used the data files in the [Inertial Signals] directory, there was no reference to them in the Assignment


#### REFERENCES:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

