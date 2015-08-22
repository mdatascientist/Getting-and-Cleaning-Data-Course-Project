run_analysis <- function(){

  # Collect, work with, and clean a data set.
  # GOAL: Prepare tidy data that can be used for later analysis. 
  
  #######################################################################################
  # NOTES: Source files architecture
  #
  # X_test + Y_test + subject_test --> measurements + activity id + subject id
  # X_train + Y_train + subject_train --> measurements + activity id + subject id
  #
  # activity id --> maps to reference table activity_labels (col1 = id, col2 = description)
  # subject id --> no subject (Person) descriptions are available, the participants 
  #                 in the study are identified by a number only
  #
  # X-test and X_train --> columns name [V1...V561] 
  #     --> map to features (col1 = id, col2 = feature) *** Used to name columns
  #
  # *** Never used the data files in the [Inertial Signals] directory, there was no 
  #     reference to them in the Assignment
  #
  #######################################################################################

  library(dplyr)
  
  #######################################################################################
  # Import the test data files (X_test & Y_test = 2947 rows)
  #######################################################################################
  X_test <- read.table("./Data/UCI HAR Dataset/test/X_test.txt",sep = "",header = FALSE)
  Y_test <- read.table("./Data/UCI HAR Dataset/test/Y_test.txt",sep = "",header = FALSE)
  names(Y_test) <- c("activity")

  #######################################################################################
  # Import the train data files (X_train & Y_train = 7352 rows)
  #######################################################################################
  X_train <- read.table("./Data/UCI HAR Dataset/train/X_train.txt",sep = "",header = FALSE)
  Y_train <- read.table("./Data/UCI HAR Dataset/train/Y_train.txt",sep = "",header = FALSE)
  names(Y_train) <- c("activity")

  #######################################################################################
  # Import the reference data files
  #######################################################################################
  
  # SUBJECTS
  subject_test <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt")
  names(subject_test) <- c("subject") 
  
  subject_train <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")
  names(subject_train) <- c("subject") 
  
  # ACTIVITIES
  activity_labels <- read.table("./Data/UCI HAR Dataset/activity_labels.txt",header = FALSE,sep = "")
  names(activity_labels) <- c("activity_id","activity")
  
  # FEATURES 
  features <- read.table("./Data/UCI HAR Dataset/features.txt",header = FALSE,sep = "")
  names(features) <- c("feature_id","feature")
  
  #######################################################################################
  # STEP 1: Merges the training and the test sets to create one data set.
  #######################################################################################
  XYCombined <- rbind(X_test,X_train)
  
  #######################################################################################
  # STEP 2: Extracts only the measurements on the mean and standard deviation for
  #         each measurement. 
  #######################################################################################

  # Temporarily extract the mean and standard deviation columns, will rename in STEP 4
  # I could have renamed all the columns here, however that would negate the need for
  # STEP 4
  means_stds <- features[grep("(mean|std)\\(", features[,2]),]
  XYCombinedMS <- XYCombined[,means_stds[,1]]

  #######################################################################################
  # STEP 3: Uses descriptive activity names to name the activities in the data set
  #######################################################################################
  # Changes acitivity id appended earlier to descriptive label names
  # 1 = WALKING
  # 2 = WALKING_UPSTAIRS
  # 3 = WALKING_DOWNSTAIRS
  # 4 = SITTING
  # 5 = STANDING
  # 6 = LAYING
   
  #Add Subject Id to datasets
  subjects <- rbind(subject_test,subject_train)
  
  #Add Activity Id to datasets
  activity <- rbind(Y_test,Y_train)
  
  XYCombinedSA <- cbind(subjects,activity,XYCombinedMS)
  
  XYCombinedSA$activity <- factor(XYCombinedSA$activity
                                   ,levels = activity_labels$activity_id
                                   ,labels = activity_labels$activity)
  
  #######################################################################################
  # STEP 4: Appropriately labels the data set with descriptive variable names. 
  # 
  # TAKEN FROM DISCUSSION FORUM: David's very long and detailed project FAQ
  # Is step 4 the same as step 3
  # Since it say labels the data set it is talking about the variable names 
  # (which at the moment are V1, V2, etc.... XYCombinedSA for me!
  # 
  # Add the features column names to the tidy data output
  # NOTE: Remember that columns 1 and 2 contain the subject and activity
  #######################################################################################
  
  feature_names <- features[grep("(mean|std)\\(", features[,2]),]
  XYCombinedFeatures <- XYCombinedSA[3:68]
  
  colnames(XYCombinedFeatures) <- feature_names[,2]
  XYCombinedLabeled <- cbind(XYCombinedSA[1:2],XYCombinedFeatures)
  
  #######################################################################################
  # STEP 5: From the data set in step 4, creates a second, independent tidy data set 
  # with the average of each variable for each activity and each subject.
  #######################################################################################

  # Average of each variable for each activity and each subject
  tidyData <- aggregate(. ~subject + activity, XYCombinedLabeled, mean)
  
  # Order the activity column alphabetically
  # NOTE: Cannot use -[column name] for sorting as activity is a factor, 
  #       used desc() to sort the activity description alphabetically, looks nicer!
  tidyDataSorted<- tidyData[order(tidyData$subject
                                   ,desc(tidyData$activity)
                                   ,decreasing = FALSE),]
  
  #######################################################################################
  # Use semi-colon as separator as feature names contain commas, 
  # e.g. tBodyAcc-arCoeff()-X,1 (the mean and std columns do not have this issue,
  #       however, if all the columns are used this would be appropriate)
  # this can cause column heading issues if using the data in Excel,etc...
  # 
  # remove row names (this creates and extra column at the beginning of the line)
  # NOTE: row.names = FALSE, otherwise an extra column is added to the beginning
  #       of the line
  #######################################################################################
  
  # Finally write the Very Tidy Data to a file.
  write.table(tidyDataSorted,file = "tidyData.txt",row.names = FALSE,sep = ";",quote = FALSE)
  
}
