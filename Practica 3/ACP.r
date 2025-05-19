#ACP

dataset=read.csv("C:/Users/Sergio/Desktop/Reduccion Dimension/dataset.csv")

library(caTools)
set.seed((123))
split=sample.split(dataset$Fire.Alarm, SplitRatio=0.8)  #80% para entrenamiento
training_set=subset(dataset, split==TRUE)
testing_set=subset(dataset, split==FALSE)

training_set=training_set[,c(3:14,16)]
testing_set=testing_set[,c(3:14,16)]

#Escalar valores
training_set[,-13]=scale(training_set[,-13])
testing_set[,-13]=scale(testing_set[,-13])


#Proyeccion de las componentes principales
#install.packages("caret")
library(caret)
#install.packages("e1071")
library(e1071)

#Variable sobre el cual se reduciran los datos
pca=preProcess(x=training_set[,-13],method="pca",pcaComp=2)
training_set=predict(pca,training_set)
training_set=training_set[,c(2,3,1)]

testing_set=predict(pca,testing_set)
testing_set=testing_set[,c(2,3,1)]

# Visualización
plot(training_set)
