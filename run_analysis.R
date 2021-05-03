library(dplyr);

Filename <- "Peer Grade assignment3.zip"

if (!file.exists("Filename")){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL,destfile=Filename)
}

if (!file.exists("UCI HAR Dataset")){
  unzip(Filename)
}

features <- read.table("./UCI HAR Dataset/features.txt",col.names = c("n","functions"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names = c("code","activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names = c("subject")) 
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names = features$functions)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names = "code")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names = c("subject")) 
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names = features$functions)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names = "code")

#############Step 1####################################

X <- rbind (x_train,x_test)
Y <- rbind (y_train,y_test)
subject <- rbind(subject_train,subject_test)
Merged <- cbind(subject,Y,X)

###################################Step 2####################################

Tidydata <- Merged %>% select(subject,code,contains("mean"),contains("std"))


##############################Step 3######################################

Tidydata$code <- activities[Tidydata$code,2]

##############################Step 4########################################
names(Tidydata)[2]<- "activity"
names(Tidydata)<-gsub("Acc", "Accelerometer", names(Tidydata))
names(Tidydata)<-gsub("Gyro", "Gyroscope", names(Tidydata))
names(Tidydata)<-gsub("BodyBody", "Body", names(Tidydata))
names(Tidydata)<-gsub("Mag", "Magnitude", names(Tidydata))
names(Tidydata)<-gsub("^t", "Time", names(Tidydata))
names(Tidydata)<-gsub("^f", "Frequency", names(Tidydata))
names(Tidydata)<-gsub("tBody", "TimeBody", names(Tidydata))
names(Tidydata)<-gsub("mean()", "Mean", names(Tidydata), ignore.case = TRUE)
names(Tidydata)<-gsub("std()", "STD", names(Tidydata), ignore.case = TRUE)
names(Tidydata)<-gsub("freq()", "Frequency", names(Tidydata), ignore.case = TRUE)
names(Tidydata)<-gsub("angle", "Angle", names(Tidydata))
names(Tidydata)<-gsub("gravity", "Gravity", names(Tidydata))

###########################step 5#########################################
Final_Data <- Tidydata %>%group_by(subject, activity) %>%summarise_all(funs(mean))

write.table(Final_Data, "Final_Data.txt", row.name=FALSE)