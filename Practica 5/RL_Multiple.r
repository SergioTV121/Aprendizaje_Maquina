#Regresion lineal multiple

dataset=read.csv("C:/Users/Sergio/Desktop/Ejemplo RL Multiple/Clientes.csv")
dataset=dataset[,2:5]

#Codificar variables categoricas
dataset$gender=factor(dataset$gender,
                      levels=c("Male","Female"),
                        labels = c(1,2)) #Dummy


#Dividir conjunto de datos
library(caTools)
set.seed(123)
split=sample.split(dataset$spending_score,SplitRatio=0.8)
training_set=subset(dataset,split=TRUE)
testing_set=subset(dataset,split=FALSE)

regression=lm(formula=spending_score~.,
              data=training_set)

#Predecir los resultados con el conjunto de testing
y_pred=predict(regression,newdata=testing_set)

#Consturir un modelo optimo con la Eliminacion hacia atras

SL=0.05 #Nivel de significancia 5%
regression=lm(formula=spending_score~gender+age+annual_income,data=dataset)
summary(regression)

#Se elimina el predictor de ingresos anuales
regression=lm(formula=spending_score~gender+age,data=dataset)
summary(regression)

#Se elimina el predictor de generos
regression=lm(formula=spending_score~age,data=dataset)
summary(regression)

