#Importar datos
dataset <- read.csv("C:/Users/Sergio/Desktop/Practica2/dataset.csv")

x=dataset[,c(1,10)]
View(x)

#Aplicar el metodo del codo para poder obtener el numero de clusters (k)
set.seed(5)
wcss=vector()  #Lista de los pesos
for (i in 1:10)
{
  wcss[i]<-sum(kmeans(x,i)$withinss)
}

#Graficar el codo
plot(1:10,wcss,type="b",
     main="Metodo del codo", xlab = "% Alcohol", ylab="Intensidad de Color")

#Aplicar k-means con k optimo
set.seed(5)
kmeans=kmeans(x,3,iter.max = 300,nstart = 10)

#Visualizacion de los clusters
#install.packages("cluster")
library(cluster)
clusplot(x, #variable que ocntiene los datos
         kmeans$cluster, # A que grupo pertenece)
         lines=0, #Para  puntos
         shade=TRUE,#Sombrea los puntos
         color=TRUE, #Aplica color
         labels=10,  #Etiqueta los puntos
         plotchar=FALSE,  #Simbolos iguales para todos los grupos
         span=TRUE,  #Aparece una elipse que delimita el grupo
         main="Bebidas Alcoholicas",  #Titulo
         xlab="% Alcohol",   #Titulo del eje x
         ylab="Intensidad de Color")   #Titulo del eje y

