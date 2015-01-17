# Getting-and-Cleaning-Data
Created for the John Hopkins Data Science course module "Getting and Cleaning Data"

##Steps to execute run_analysis.R

1. Download the data set from"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Unzip the "UCI HAR Dataset" to the working directory
3. Make sure the libraries "data.table" and "plyr" are loaded
4. setwd() to the directory which has the extracted data 
5. source the run_analysis.R file and execute function run_analysis("data_directory")
   pass the directory in which the data is extracted. The default value is set to "UCI HAR Dataset"
6. tidydata.txt output data file is generated in the data_directory path.
