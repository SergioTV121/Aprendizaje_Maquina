import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Importar el dataset con pandas
dataset=pd.read_csv("dataset.csv")
x=dataset.iloc[:,[0,9]].values


#Utilizar el dendograma para encontrar el numero optimo de grupos en Jerarquico
import scipy.cluster.hierarchy as sch
dendogram=sch.dendrogram(sch.linkage(x,method="ward"))  #Tipo de enlace
plt.title("Dendograma")
plt.xlabel("% Alcohol")
plt.ylabel("Intensidad de Color")
plt.show()

#Ajustar el grupo jerarquico al conjunto de datos
from sklearn.cluster import AgglomerativeClustering
hc=AgglomerativeClustering(n_clusters=3,affinity="euclidean",linkage="ward")
y_hc=hc.fit_predict(x)

#Visualizar grupos
plt.scatter(x[y_hc==0,0],x[y_hc==0,1],s=100,c="red",label="Grupo 1")    #Cautos
plt.scatter(x[y_hc==1,0],x[y_hc==1,1],s=100,c="blue",label="Grupo 2")    #Estandard
plt.title("Bebidas Alcoholicas")
plt.xlabel("% Alcohol")
plt.ylabel("Intensidad de Color")
plt.show()

