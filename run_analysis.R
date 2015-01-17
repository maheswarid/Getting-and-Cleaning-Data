run_analysis<- function(data_directory){
    data_files <- list.files(data_directory,recursive=TRUE)
    
    #Read the Y data from both train and test data sets into a table
    
    yactivity_trainData <- read.table(file.path(data_directory,"train","y_train.txt"))
    yactivity_testData <- read.table(file.path(data_directory,"test","y_test.txt"))
    
    xfeature_trainData <- read.table(file.path(data_directory,"train","x_train.txt"))
    xfeature_testData <- read.table(file.path(data_directory,"test","x_test.txt"))
    
    subject_trainData <- read.table(file.path(data_directory,"train","subject_train.txt"))
    subject_testData <- read.table(file.path(data_directory,"test","subject_test.txt"))
    
    #combine the training and test data sets 
    subjectSet <- rbind(subject_trainData,subject_testData)
    activitySet <- rbind(yactivity_trainData,yactivity_testData)
    featureSet <- rbind(xfeature_trainData,xfeature_testData)
    
    #assign names to the datasets
    names(subjectSet)<- c("subject")
    names(activitySet) <- c("activity")
    featurenames <- read.table(file.path(data_directory,"features.txt"))
    names(featureSet)<-featurenames$V2
    
    #form the data frame
    humanActivityData <- cbind(subjectSet,activitySet)
    
    #combined data frame for Train and Test data
    humanActivityData <- cbind(humanActivityData,featureSet)
    
    #Extracts only the measurements on the mean and standard deviation for each measurement
    selectedfeatures <- grep("+mean\\(\\)|std\\(\\)",as.character(featurenames$V2),value=TRUE)
    selectedColNames <- c("subject","activity",selectedfeatures)
    HAD_subgroup <- humanActivityData[,selectedColNames]
    
    #Uses descriptive activity names to name the activities in the data set
    activityNames <- read.table(file.path(data_directory,"activity_labels.txt"))
    HAD_subgroup$activity <- as.character(HAD_subgroup$activity)
    for(i in 1:length(activityNames$V2))
    {
        HAD_subgroup$activity[HAD_subgroup$activity == i] <- as.character(activityNames$V2[i])
    }
    HAD_subgroup$activity <- as.factor(HAD_subgroup$activity)
    
    #Appropriately labels the data set with descriptive variable names.
    # change the subject to appropriate names
    HAD_subgroup$subject <- as.character(HAD_subgroup$subject)
    for(i in 1:length(HAD_subgroup$subject))
    {
        HAD_subgroup$subject[i] <-paste("Volunter",HAD_subgroup$subject[i])
    }
    
    #change features variable names --> meaningful readable names
    names(HAD_subgroup) <- gsub("Acc", "Accelerator", names(HAD_subgroup))
    names(HAD_subgroup) <- gsub("Mag", "Magnitude", names(HAD_subgroup))
    names(HAD_subgroup) <- gsub("Gyro", "Gyroscope", names(HAD_subgroup))
    names(HAD_subgroup) <- gsub("^t", "time", names(HAD_subgroup))
    names(HAD_subgroup) <- gsub("^f", "frequency", names(HAD_subgroup))
    names(HAD_subgroup) <- gsub("BodyBody", "Body", names(HAD_subgroup))
    #HAD_subgroup
    #Using the plyr library do the average of variable grouped by person subject per activity 
    TidySet<-aggregate(. ~subject + activity, HAD_subgroup, mean)
    TidySet<-TidySet[order(TidySet$subject,TidySet$activity),]
    write.table(TidySet, file = "tidydata.txt",row.name=FALSE)
    
   
}