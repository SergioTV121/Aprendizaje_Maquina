
library(caTools)
library(ISLR)
library(MASS)
library(dplyr)
set.seed(123)

dataset = read.csv("C:/Users/Sergio/Desktop/Practica 8/dataset.csv")

#Codificar variables categoricas
dataset$HeartDisease=factor(dataset$HeartDisease,
                      levels=c("Yes","No"),
                      labels = c(1,0)) #Dummy
dataset$PhysicalActivity=factor(dataset$PhysicalActivity,
                            levels=c("Yes","No"),
                            labels = c(1,0)) #Dummy
dataset$Smoking=factor(dataset$Smoking,
                                levels=c("Yes","No"),
                                labels = c(1,0)) #Dummy
dataset$AlcoholDrinking=factor(dataset$AlcoholDrinking,
                       levels=c("Yes","No"),
                       labels = c(1,0)) #Dummy
dataset$Stroke=factor(dataset$Stroke,
                       levels=c("Yes","No"),
                       labels = c(1,0)) #Dummy
dataset$DiffWalking=factor(dataset$DiffWalking,
                       levels=c("Yes","No"),
                       labels = c(1,0)) #Dummy
dataset$Sex=factor(dataset$Sex,
                           levels=c("Male","Female"),
                           labels = c(1,0)) #Dummy
dataset$Race=factor(dataset$Race,
                           levels=c("White","Black","Asian","American Indian/Alaskan Native","Hispanic"),
                           labels = c(0.2,0.4,0.6,0.8,1.0)) #Dummy
dataset$Diabetic=factor(dataset$Diabetic,
                           levels=c("Yes","No","No, borderline diabetes"),
                           labels = c(1,0,0.5)) #Dummy
dataset$GenHealth=factor(dataset$GenHealth,
                           levels=c("Excellent","Very good","Good","Fair","Poor"),
                           labels = c(1,0.8,0.6,0.4,0.2)) #Dummy
dataset$AgeCategory=factor(dataset$AgeCategory,
                         levels=c("18-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79","80 or older"),
                         labels = c(0.076,0.158,0.230,0.307,0.384,0.461,0.538,0.615,0.692,0.769,0.846,0.923,1)) #Dummy
dataset$Asthma=factor(dataset$Asthma,
                        levels=c("Yes","No"),
                        labels = c(1,0)) #Dummy
dataset$KidneyDisease=factor(dataset$KidneyDisease,
                      levels=c("Yes","No"),
                      labels = c(1,0)) #Dummy
dataset$SkinCancer=factor(dataset$SkinCancer,
                             levels=c("Yes","No"),
                             labels = c(1,0)) #Dummy


# Dividir los datos
split = sample.split(dataset$HeartDisease, SplitRatio = 0.8)

# Conjunto de prueba y entrenamiento
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

# Escalado de variables
training_set[c(2,6,7)] = scale(training_set[c(2,6,7)])
testing_set[c(2,6,7)] = scale(testing_set[c(2,6,7)])

# Ajustar modelo de clasificador
regression = glm(formula = HeartDisease ~ .,
                 data = training_set,
                 family = "binomial")

# Predecir los resultados con el conjundo de Prueba
predicted_values = predict(regression, testing_set, type = "response")
predicted_class = ifelse(predicted_values > 0.5, 1, 0)
performance_data = data.frame(observed = testing_set$HeartDisease,
                              predicted = predicted_class)

positive <- sum(performance_data$observed==1)
negative <- sum(performance_data$observed==0)
predicted_positive <- sum(performance_data$predicted==1)
predicted_negative <- sum(performance_data$predicted==0)
total <- nrow(performance_data)
data.frame(positive, negative,predicted_positive,predicted_negative)

tp<-sum(performance_data$observed==1 & performance_data$predicted==1)
tn<-sum(performance_data$observed==0 & performance_data$predicted==0)
fp<-sum(performance_data$observed==0 & performance_data$predicted==1)
fn<-sum(performance_data$observed==1 & performance_data$predicted==0)
cm=data.frame(tp,tn,fp,fn)


