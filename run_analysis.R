## Read and process metadata
variables     <- read.table( "UCI HAR Dataset/features.txt" )
variables[,2] <- gsub( "\\(|\\)-", "", variables[,2] )
variables[,2] <- gsub( "-", "_", variables[,2] )

activities  <- read.table( "UCI HAR Dataset/activity_labels.txt" )

## Read test data
subject_train  <-  read.table("UCI HAR Dataset/train/subject_train.txt", 
                               col.names=c("subject") )
X_train        <-  read.table("UCI HAR Dataset/train/X_train.txt",
                               col.names=variables[,2])
y_train        <-  read.table("UCI HAR Dataset/train/y_train.txt",
                               col.names=c("activity"))

subject_test   <-  read.table("UCI HAR Dataset/test/subject_test.txt", 
                               col.names=c("subject") )
X_test         <-  read.table("UCI HAR Dataset/test/X_test.txt",
                               col.names=variables[,2])
y_test         <-  read.table("UCI HAR Dataset/test/y_test.txt",
                               col.names=c("activity"))

## Merge test and train data
subject    <-  rbind( subject_train, subject_test )
feat.vec   <-  rbind( X_train, X_test )
activity   <-  rbind( y_train, y_test )

## Extract relevant columns
u.std.cols     <- grep("mean|std", colnames(feat.vec))
u.std.feat.vec <- feat.vec[,u.std.cols]

## Re-label activity as text instead of number
activity <- factor( activity$activity,
                    levels = activities[,1],
                    labels = activities[,2]) 

## Merge all variables into a data frame
data.set.1  <-  cbind( subject, activity, u.std.feat.vec )

## Average over subject and activity
library(dplyr)
data.set.2  <-  data.set.1 %>% 
                group_by( subject, activity ) %>% 
                summarise_each( funs(mean) )

write.table( data.set.2, file="dataframe2.txt",row.name=FALSE )


