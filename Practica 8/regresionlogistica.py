# REGRESION LOGISTICA

# Importamos librerias
import pandas as pd
from sklearn import metrics
import numpy  as np
from sklearn.metrics import *
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn.linear_model import LogisticRegression
import matplotlib.pyplot as plt

#Cargar dataset
dataset = pd.read_csv("dataset.csv")
X=dataset.iloc[:,[1,5]].values
y=dataset.iloc[:,0].values

#Variables ficticias
from sklearn.preprocessing import LabelEncoder
codificadorDatos=LabelEncoder()
y=codificadorDatos.fit_transform(y)

#Dividir conjunto de datos en pruebas y entrenamiento
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)


# Creación del modelo
clf = LogisticRegression()

# Ajustamos el modelo a los datos de entrenamiento
clf = clf.fit(X_train, y_train)


# Realizamos prediciones
y_pred = clf.predict(X_test)

# Matriz de Confusión
cm = confusion_matrix(y_test, y_pred)
print('Matriz de Confusión:')
print(cm)

# Métricas de matriz de confusión
print(classification_report(y_test, y_pred))

# Cálculo la exactitud del modelo
accuracy = accuracy_score(y_test, y_pred)
print('Exactitud del modelo:')
print(accuracy)
