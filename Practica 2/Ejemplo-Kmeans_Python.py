from cProfile import label
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Importar los datos del centro comercial con pandas
dataset=pd.read_csv("dataset.csv")
x=dataset.iloc[:,[0,9]].values


#Utilizar el codo de Jambu para encontrar el numero optimo de grupos en Kmeans
from sklearn.cluster import KMeans
wcss=[]     #Lista para los pesos

for i in range(1,11):
    kmeans=KMeans(n_clusters=i,init="k-means++",max_iter=300,n_init=10,random_state=0)
    kmeans.fit(x)   #Ajustar la matriz de caracteristicas
    wcss.append(kmeans.inertia_)    #Agrega el atributo en la lista wcss

#Grafica de codo
plt.plot(range(1,11),wcss)
plt.title("Metodo del codo")
plt.xlabel("Numero de clusters")
plt.ylabel("WCSS(k)")
plt.show()


#Aplicar k-means para agrupar el dataset una vez obtenido el numero de grupos
kmeans=KMeans(n_clusters=3,init="k-means++",max_iter=300,n_init=10,random_state=0)
y_kmeans=kmeans.fit_predict(x)


#Visualizar grupos
plt.scatter(x[y_kmeans==0,0],x[y_kmeans==0,1],s=100,c="red",label="Grupo 1")    #Precavidos
plt.scatter(x[y_kmeans==1,0],x[y_kmeans==1,1],s=100,c="blue",label="Grupo 2")    #Estandar
plt.scatter(x[y_kmeans==2,0],x[y_kmeans==2,1],s=100,c="green",label="Grupo 3")    #Objetivo
plt.title("Bebidas Alcoholicas")
plt.xlabel("% Alcohol")
plt.ylabel("Intensidad de Color")
plt.show()

