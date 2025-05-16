
#Importar datos
dataset<-read.csv("C:/Users/Sergio/Desktop/Actividad4/Data.csv")

#Limpieza de datos
dataset$Age=ifelse(is.na(dataset$Age),
                    ave(dataset$Age, FUN=function(x) mean(x,na.rm=TRUE)),
                    dataset$Age)


dataset$Annual_Income=ifelse(is.na(dataset$Annual_Income),
                    ave(dataset$Annual_Income, FUN=function(x) mean(x,na.rm=TRUE)),
                    dataset$Annual_Income)


dataset$Spending_Score=ifelse(is.na(dataset$Spending_Score),
                    ave(dataset$Spending_Score, FUN=function(x) mean(x,na.rm=TRUE)),
                    dataset$Spending_Score)                    


#Codificar variables categoricas (Sin usar doomies)
dataset$Genre= factor(dataset$Genre,
                     levels=c("Male","Female"),
                     labels=c(1,0))


#Dividir los datos en base de entrenamiento y prueba
#80% entrenamiento  20% prueba

library(caTools)
set.seed(123)
vectorEP=sample.split(dataset$Spending_Score, SplitRatio=0.8)

bEntrenamiento=subset(dataset, vectorEP==TRUE)
bPrueba=subset(dataset, vectorEP==FALSE)


#Estandarizar los datos (Normalizar)

bEntrenamiento[,3:4]=scale(bEntrenamiento[,3:4])
bPrueba[,3:4]=scale(bPrueba[,3:4])




