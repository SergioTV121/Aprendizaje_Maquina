# Lectura de datos
dataset = read.csv("ESCOM/ML/Actividades/RD/dataset.csv")
dataset = dataset[0:100,3:16]
View(dataset)

# Se instala y se activa catTools para 
#install.packages('caTools')
library(caTools)

# Elige de manera aleatoria a todos los individuos
set.seed(1000)

# Train Test Split
split = sample.split(dataset$Fire.Alarm, SplitRatio = 0.8)
trainSet = subset(dataset,split=TRUE) 
testSet = subset(dataset,split=FALSE) 

# Data scale
trainSet[,1:12] = scale(trainSet[,1:12])
testSet[,1:12] = scale(testSet[,1:12])

library(kernlab)

# Aplicación del KPCA
kpca = kpca(~., 
    data=trainSet[,-13],
    kernel = "rbfdot",
    features = 2
)

trainset_pca = as.data.frame(predict(kpca,trainSet))
testset_pca = as.data.frame(predict(kpca,testSet))

# Visualización
View(trainset_pca)
plot(trainset_pca)