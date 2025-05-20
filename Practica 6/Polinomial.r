#Regresion lineal multiple

dataset=read.csv("C:/Users/Sergio/Desktop/RL_Polinomial/dataset.csv")


#Dividir conjunto de datos
library(caTools)
set.seed((123))
split=sample.split(dataset$Y, SplitRatio=0.8)  #80% para entrenamiento
training_set=subset(dataset, split==TRUE)
testing_set=subset(dataset, split==FALSE)


#Ajustar el modelo de regresion lineal
lin_reg=lm(formula=Y~.,
              data=training_set)

training_set$X2=training_set$X^2
training_set$X3=training_set$X^3
training_set$X4=training_set$X^4


#Visualizar modelo lineal
library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$X,y=training_set$Y),
             color="red")+
  geom_line(aes(x=training_set$X,y=predict(lin_reg,newdata=training_set)),
             color="blue")+
  
  ggtitle("Prediccion lineal")+
  xlab("X")+
  ylab("Y")



#Visualizar el modelo polinomico
poly_reg=lm(formula=Y~.,
            data=training_set)
X_grid=seq(min(training_set$X),max(training_set$X),0.1)  #np.arrange en Python
ggplot()+
  geom_point(aes(x=training_set$X,y=training_set$Y),
             color="red")+
  geom_line(aes(x=X_grid,y=predict(poly_reg,
                                   newdata=data.frame(X=X_grid,
                                                      X2=X_grid^2,
                                                      X3=X_grid^3,
                                                      X4=X_grid^4))),
             color="blue")+
  
  ggtitle("Prediccion polinomial")+
  xlab("X")+
  ylab("Y")


#Predecir Y con x=-49.6996997

#Predecir los resultados con regresion lineal
y_pred=predict(lin_reg,newdata=data.frame(X=-49.6996997))


#Predecir los resultados con regresion polinomial
y_pred_poly=predict(poly_reg,newdata=data.frame(X=-49.6996997,
                                                X2=-49.6996997^2,
                                                X3=-49.6996997^3,
                                                X4=-49.6996997^4))

cat("Y estimada con el modelo lineal: ",y_pred)
cat("Y estmidada con el modelo polinomial:",y_pred_poly)
cat("Valor real de Y:",testing_set$Y[1])

