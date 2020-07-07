# All data read into R.
# Training and Test data bound 
train<- read.table("./train/X_train.txt")
test<-read.table("./test/X_test.txt")
bound.data <- rbind(train,test)


train.subject <- read.table("./train/subject_train.txt")
test.subject <- read.table("./test/subject_test.txt")
subjects<- rbind(train.subject,test.subject) 


train.labels<- read.table("./train/Y_train.txt") 
test.labels<-read.table("./test/y_test.txt")
labels<- rbind(train.labels,test.labels)

head(labels)
features<- read.table("features.txt")
head(features)



#Relevant mean and SD columns extracted 

meanSD <- grep("mean\\(\\)|std\\(\\)", features[, 2])
print(meanSD)

# Data made more understandable , removed uneccessary characters, columns capitalized
bound.data<- bound.data[,meanSD]
names(bound.data) <- gsub("\\(\\)", "", features[meanSD, 2]) 
names(bound.data) <- gsub("mean", "Mean", names(bound.data)) 
names(bound.data) <- gsub("std", "Std", names(bound.data)) 
names(bound.data) <- gsub("-", "", names(bound.data))


View(bound.data)
collect<- rbind(meanSD,bound.data)


a.names <- read.table("./activity_labels.txt")
a.names[, 2] <- tolower(gsub("_", "", a.names[, 2]))
substr(a.names[2, 2], 8, 8) <- toupper(substr(a.names[2, 2], 8, 8))
substr(a.names[3, 2], 8, 8) <- toupper(substr(a.names[3, 2], 8, 8))


# columns named and data bound by column to subjects and labels.
ac.Label <- a.names[labels[, 1], 2]
labels[,1]<- ac.Label
names(labels) <- "activity"
head(labels) 
labels 
names(final)[1] <- "subjects"
final<- cbind(subjects, labels, bound.data)

# second tidy data set made subjects and activity grouped and shown by mean.
library(reshape2)
sec<- dcast(final, subjects~ activity, mean)