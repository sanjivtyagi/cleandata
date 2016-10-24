run_analysis <- function(){

	datar <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	destr <- "/Users/styagi/Documents/coursera/dataclean.zip"

	# set current directory
	setwd("/Users/styagi/Documents/coursera/")

	#download file if not exits
	if (!file.exists(destr)){
	download.file(datar,destr,method="curl")
	}

	# unzip file 
	if (!file.exists("UCI HAR Dataset")) { 
  	unzip(destr) 
	}

	## Step 1
	# Load & Merge training and test Dataset 
	trainx <- read.table("UCI HAR Dataset/train/X_train.txt")
	trainy <- read.table("UCI HAR Dataset/train/Y_train.txt")
	trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt")

	train <- cbind(trainsub,trainy,trainx)

	testx <- read.table("UCI HAR Dataset/test/X_test.txt")
	testy <- read.table("UCI HAR Dataset/test/Y_test.txt")
	testsub <- read.table("UCI HAR Dataset/test/subject_test.txt")

	test <- cbind(testsub,testy,testx)

	compx <- rbind(trainx,testx)
	compy <- rbind(trainy,testy)
	compsub <- rbind(trainsub,testsub)

	compData <- rbind(train, test)
	
	## Step 2
	# List Descriptive Activity and Feature 
	
	features <- read.table("UCI HAR Dataset/features.txt")
	featurescol <- as.character(features[,2])

	# Extract data on mean & standard deviation 
	featmeanstd <- grep(".*mean.*|*.std.*",featurescol)
	featuresname <- featurescol[featmeanstd]
	
	
	

	## Step 3
	# Describe Activity Names
	activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
	activityLabelscol <- as.character(activityLabels[,2])
	compy[,1] <- activities[compy[, 1], 2]

	## Step 4
	# Appropriately label the data set
	compData <- cbind(compData[,	c(1,2)],compData [,c(3:ncol(compData))][featmeanstd])
	names(compData) <- c("subject", "activity", featuresname)

	## Step 5
	# Average by activity and subject
	averages_data <- ddply(compData, .(subject, activity), function(x) colMeans(x[, 1:66]))
	write.table(averages_data, "averages_data.txt", row.name=FALSE)


}


