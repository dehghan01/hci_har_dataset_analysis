#DEPENDENCY: dplyr

#run analysis
run = function() {
    library(dplyr)
    #create a directory to unzip and run the data analysis within
    if(!file.exists("data_analysis")){
        dir.create("data_analysis")
    }
    setwd("data_analysis")
    #download UCI HAR Dataset
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "UCI HAR Dataset.zip", method = "curl")
    #unzip dataset and change working directory
    unzip("UCI HAR Dataset.zip")
    setwd("UCI HAR Dataset/")
    
    complete.dataset <- .readData()
    complete.dataset <- .setDataLabel(file = complete.dataset)
    complete.dataset <- .setVariableNames(file = complete.dataset)
    slice.data <- .sliceDataSet(file = complete.dataset)
    .final(slice.data)
}

#read data
.readData = function(){
    #read the training data
    train <- data.table::fread("train/X_train.txt", sep = " ")
    train.labels <- data.table::fread("train/y_train.txt")
    train.subjects <- data.table::fread("train/subject_train.txt")
    train$label <- train.labels$V1
    train$subject <- train.subjects$V1
    rm(train.labels)
    rm(train.subjects)
    
    #read the test data
    test <- data.table::fread("test/X_test.txt", sep = " ")
    test.labels <- data.table::fread("test/y_test.txt")
    test.subjects <- data.table::fread("test/subject_test.txt")
    test$label <- test.labels$V1
    test$subject <- test.subjects$V1
    rm(test.labels)
    rm(test.subjects)
    
    #combine training and test set
    complete.dataset <- rbind(test, train)
    rm(test)
    rm(train)
    assign("complete.dataset", complete.dataset, envir = .GlobalEnv)
    complete.dataset
}

## set descriptive data lables. 
.setDataLabel = function(file, schema = "activity_labels.txt"){
    activity.labels <- read.table(schema, sep = " ", stringsAsFactors = FALSE)$V2
    file$label <- factor(file$label, labels = activity.labels)
    file
}

## set descriptive the variables names
# Schema found in "UCI HAR Dataset/features.txt", semantics in "features_info.txt"
.setVariableNames = function(file, schema = "features.txt"){
    features.labels <- read.table(schema, sep = " ", stringsAsFactors = FALSE)
    features.labels <- rbind(features.labels, c(562, "label"))
    features.labels <- rbind(features.labels, c(563, "subject"))
    names(file) <- features.labels$V2
    rm(features.labels)
    file
}

# extracts only the measurements on the mean and standard deviation for each measurement. 
.sliceDataSet = function(file){
    file <- dplyr::select(file, matches("mean|std\\("), label, subject)
    assign("slice.data", file, envir = .GlobalEnv)
    file
}

# average each variable by label and subject, and print to file
.final = function(file){
    grouped <- dplyr::group_by(file, label, subject)
    summed <- dplyr::summarise_each(grouped, funs(mean))
    dt <- data.table::data.table(summed)
    #alternative:
    #dt <- file %>% group_by(label, subject) %>% summarise_each(funs(mean)) %>% data.table::data.table()
    
    assign("summarised.mean.std", dt, envir = .GlobalEnv)
    rm(grouped)
    rm(summed)
    #write table to text file
    write.table(dt, file = "../q5.txt", row.names = FALSE)
    rm(dt)
}
