#Importar datos
dataset <- read.csv("C:/Users/Sergio/Desktop/Practica2/dataset.csv")
View(dataset)

x=dataset[,c(1,10)]

#Utilizar el dendograma para encontrar el numero optimo de grupos
dendogram=hclust(dist(x,method="euclidean"),
                  method = "ward.D")

plot(dendogram,
     main="Dendograma",
     xlab="% Alcohol",
     ylab="Intensidad de Color")


#Ajustar el agrupamiento jerarquico al dataset
hc=hclust(dist(x,method="euclidean"),
                  method = "ward.D")
y_hc=cutree(hc,k=3)

#Visualizar los clusters
#install.packages("cluster")
library(cluster)
clusplot(x,  #Variable que contiene los datos
         y_hc,  #variable que contiene a que grupo pertenece cada observacion
         lines=0,
         shade=TRUE,
         color=TRUE,
         labels=5,
         plotchar=FALSE,
         span=TRUE,
         main="Bebidas Alcoholicas",
         xlabel="% Alcohol",
         ylabel="Intensidad de Color")

