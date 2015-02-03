library(reshape2)

## Read Files
activity_labels<-read.table("data/UCI HAR Dataset/activity_labels.txt")[,2]
features<-read.table("data/UCI HAR Dataset/features.txt")[,2]
subject_test<-read.table("data/UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("data/UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("data/UCI HAR Dataset/test/Y_test.txt")
subject_train<-read.table("data/UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("data/UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("data/UCI HAR Dataset/train/Y_train.txt")

## add feature names
names(X_test)<-features
names(X_train)<-features

## Choose the columns we want
meanstdFeatures<-grep("mean|std", features)

## Select the columns and combine the datasets
X_test<-X_test[,meanstdFeatures]
X_train<-X_train[,meanstdFeatures]
combined<-rbind(X_test,X_train)

## Convert the activity codes to words
activitycodes<-c(Y_test$V1, Y_train$V1)
activity<-activity_labels[activitycodes]

## Get the subject codes
subject<-c(subject_test$V1, subject_train$V1)

## Put everything together
combined<-cbind(subject,activity,combined)

## Summarize
splitCols<-colnames(combined)[1:2]
dataCols<-colnames(combined)[3:length(colnames(combined))]
reshape<-melt(combined, id=splitCols, measure.vars=dataCols)
tidy<-dcast(reshape, subject + activity ~ variable, mean)

## Write the tidy dataset
write.table(tidy, file="./tidy_data.txt", row.name=FALSE)
