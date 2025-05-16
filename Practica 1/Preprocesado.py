import numpy as np
import pandas as pd

#Cargo los datos
ds=pd.read_csv("Data.csv")

x=ds.iloc[:,1:-1].values     #Crear variable ind. 
y=ds.iloc[:,4].values       #Crear variable dep.(Comprado)


#Correccion de datos faltantes
#Limpieza de datos
from sklearn.impute import SimpleImputer
dImputados=SimpleImputer(missing_values=np.nan,strategy='mean',verbose=0)
dImputados=dImputados.fit(x[:,1:4])
x[:,1:4]=dImputados.transform(x[:,1:4])

dImputados=dImputados.fit(y)
y=dImputados.transform(y)

#Transformacion de datos
from sklearn.preprocessing import LabelEncoder  #Convertir datos categoricos ordinales

#Calcula los datos categoricos y su equivalente en numero (Variables dummies)
codificadorDatos=LabelEncoder()
x[:,0]=codificadorDatos.fit_transform(x[:,0])   #Codificar generos


from sklearn.preprocessing import OneHotEncoder#Convertir datos categoricos NO ordinales
from sklearn.compose import ColumnTransformer

#Transformacion de generos
ct=ColumnTransformer(
        [('one_hot_encouder',OneHotEncoder(categories='auto'),[0])],
        remainder='passthrough'
    )

x=np.array(ct.fit_transform(x), dtype=float)

#Dividir los datos en base de entrenamiento y prueba
from sklearn.model_selection import train_test_split
#80% entrenamiento   20% prueba
xEntrenamiento, xPrueba, yEntrenamiento, yPrueba=train_test_split(x,y,
                                                                  test_size=0.2,
                                                                  random_state=0)

#Normalizar datos

from sklearn.preprocessing import StandardScaler

scX=StandardScaler()
xEntrenamiento=scX.fit_transform(xEntrenamiento)
xPrueba=scX.transform(xPrueba)

print(xPrueba)
