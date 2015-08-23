---
output: 
  html_document: 
    theme: spacelab
---
# Getting and Cleaning Data: Course Project (2015)
## Introduction
This repository contains the files associated with the Getting and Cleaning data course project.  

The files are:

- Run_analysis.R - R script code that transforms the source data files to a single tidy data file adhering to the steps outlined in the Project specification.
- README.md - Course Project overview.
- CODEBOOK.md - Describes the data transformation steps and the relationships between the original source file and the final tidyData.csv output file.
- tidyData.txt - The file produced by excuting the run_analysis R script.

## Project Goal
The goal of the Project was to download the source files in their raw format, analysis the separate files and find their associations in order to make a meaningful set of data.  The data for means and standard deviations was then extracted from the dataset and identifiers (activities) given meaningful descriptions.   

The columns of the source data (V1,V2….) were then updated to the appropriate description feature names.  Finally the transformed dataset was written to a file tidyData.txt

## Tidy data R script
The project required the creation of an R script called run_analysis.R which performs transformation on the source data obtained from
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

the required steps to transform the data are:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally an output file is created of the transformed data and upload with the project files.

## About the Code Book
The CodeBook.md gives an overview of the data used in the project along with the original and mapped data.

