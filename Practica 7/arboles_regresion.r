#Arboles de regresion

dataset=read.csv("C:/Users/Sergio/Desktop/Practica 7/Boston.csv")
dataset=dataset[,c(7,15)]



#Dividir los datos en conjunto de pruebas y entrenamiento
library(caTools)
set.seed((123))
split=sample.split(dataset$medv, SplitRatio=0.8)  #80% para entrenamiento
training_set=subset(dataset, split==TRUE)
testing_set=subset(dataset, split==FALSE)


#Ajustar el modelo al conjunto de entrenamiento
#install.packages("rpart")
library(rpart)
regression=rpart(formula=medv~.,
                 data=training_set,
                 control=rpart.control(minsplit=2) #Num minimo de particiones
)


#Predecir un valor del conjunto de entrenamiento
y_pred=predict(regression,newdata=data.frame(rm=6.096))



#Visualizar el modelo de arbol de regresion
library(ggplot2)
X_grid=seq(min(training_set$rm),max(training_set$rm),0.01)
ggplot()+
  geom_point(aes(x=training_set$rm,y=training_set$medv),
             color="red")+
  geom_line(aes(x=X_grid,y=predict(regression,
                                   newdata=data.frame(rm=X_grid))),
             color="blue")+
  
  ggtitle("Prediccion con Arboles de Regresion")+
  xlab("Numero de habitaciones")+
  ylab("Precio de la vivienda")


cat("Precio estmidado con el modelo:",y_pred)
cat("Valor real del precio:",testing_set$medv[1])

