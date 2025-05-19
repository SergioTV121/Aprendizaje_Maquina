#LDA

dataset=read.csv("C:/Users/Sergio/Desktop/Reduccion Dimension/dataset.csv")

library(caTools)
set.seed((123))
split=sample.split(dataset$Fire.Alarm, SplitRatio=0.8)  #80% para entrenamiento
training_set=subset(dataset, split==TRUE)
testing_set=subset(dataset, split==FALSE)

training_set=training_set[,c(3:14,16)]
testing_set=testing_set[,c(3:14,16)]



library(caTools)
set.seed(123)
split =sample.split(dataset$Fire_Alarm, SplitRatio =0.8)
training_set = subset(dataset, split=TRUE)
testing_set = subset(dataset, split=FALSE)

library(MASS)

lda = lda(formula = Fire_Alarm ~ ., data = training_set)

training_set = as.data.frame(predict(lda,training_set))
training_set = training_set[,c(3,4,1)]
testing_set = as.data.frame(predict(lda,testing_set))
testing_set = testing_set[,c(3,4,1)]
