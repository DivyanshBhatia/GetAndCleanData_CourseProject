
#Sec1- Data Extraction
#To run this code you should have extracted the samsung data in your working directory
#Here "UCI HAR Dataset" is used as the root folder
#read.table is used to read the data
#Xtrain contains data frame from X_train.txt
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
#Xtest contains data frame from X_test.txt
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
#Ytrain contains data frame from Y_train.txt
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt",header=FALSE)
#Ytest contains data frame from Y_test.txt
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt",header=FALSE)
#Subject_train and Subject_test contains data frame from subject_train.txt and subject_test.txt
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)
#activity_data contains data of activity_labels.txt
activity_data<-read.table("UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE)
#features_data_frame contains data of features.txt
features_data_frame <- read.table("UCI HAR Dataset/features.txt",sep=" ",header=FALSE)
#features_info_data_frame contains data of features_info.txt
features_info_data_frame <- read.table("UCI HAR Dataset/features_info.txt",skip=32,nrows=17,sep=":",header=FALSE)
features_info_vector <- features_info_data_frame[,1]
#features_data_vector contains names of 561 attributes of dataset
features_data_vector <- features_data_frame[,2]
colnames(Xtrain) <- features_data_vector
colnames(Xtest)<- features_data_vector

#Sec2 - extracting mean and standrd deviation features
#function extract_mean_std_features is used to extract columns related to mean and standard deviation
#feature_vector is the list of 561 elements extracted from features.txt
#content to extract has mean() and std() as elements since these are the elements we need to check
extract_mean_std_features <- function(feature_vector,content_to_extract=c("mean()","std()"))
{
  req_col <- c(NA)
  for(i in 1:length(content_to_extract))  {
    
    req_col <- c(req_col,grep(content_to_extract[i],feature_vector,fixed=TRUE))
    print(c(i,":",req_col))
  }
  req_col <- unique(req_col)
  req_col <- sort(as.numeric(as.character(req_col)))
  
return(req_col[!is.na(req_col)])
}

req_vec <-extract_mean_std_features(feature_vector=features_data_vector)  
Xtrain_req <- Xtrain[,req_vec]
Xtest_req <- Xtest[,req_vec]
head(Xtrain_req,n=3)

#Sec 3- Merging Data
#Merge the train and test datasets
X_merged_data <- rbind(Xtrain_req,Xtest_req)
Y_merged_data <- rbind(Ytrain,Ytest)
colnames(Y_merged_data) <- "Activity"
subject_merged_data <- rbind(subject_train,subject_test)
colnames(subject_merged_data)<- "Subject"


  activity_lab <- c(NA)
  for(Y_merged_data_var in c(1:nrow(Y_merged_data)))
  {
    activity_lab <- c(activity_lab,as.character(activity_data[as.numeric(Y_merged_data[Y_merged_data_var,1]),"V2"]))
  }

  activity_lab<-activity_lab[!is.na(activity_lab)]
  
  X_merged_data <-cbind(subject_merged_data,activity_lab,X_merged_data)
  head(X_merged_data,n=5)
#Sec 4-Average calculation by subject and activity
#We aggregate data to produce output of step 5 and use to see initial few rows
avg_by_activity_subject <- aggregate(.~ activity_lab + Subject,data=X_merged_data,FUN=mean)
head(avg_by_activity_subject,n=18)

#Sec 5- Improving Labels
#In this section of code column names were subbed to make them more descriptive
#As described in features_info.txt t was used for time domain and f was used for frequency domain
names(avg_by_activity_subject) <- sub("mean\\(\\)","mean",names(avg_by_activity_subject))
names(avg_by_activity_subject) <- sub("std\\(\\)","Standard deviation",names(avg_by_activity_subject))
names(avg_by_activity_subject) <- sub("tBody","Average Time Domain Body",names(avg_by_activity_subject))
names(avg_by_activity_subject) <- sub("fBody","Average Frequency Domain Body",names(avg_by_activity_subject))
names(avg_by_activity_subject) <- sub("tGravity","Average Time Domain Gravity",names(avg_by_activity_subject))
names(avg_by_activity_subject) <- sub("activity_lab","Activity_Labels",names(avg_by_activity_subject))

#Sec 6- Output Result
#write.csv is used to write the output data frame to a CSV file
write.csv(file="UCI HAR Dataset/TidyDataset.csv", x=avg_by_activity_subject)