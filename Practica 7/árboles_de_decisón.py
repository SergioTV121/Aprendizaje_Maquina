# -*- coding: utf-8 -*-
"""Árboles de decisón.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1ffGiBc3UlnVYMrBcmTMW1ubu1QHip1jZ
"""

import numpy as np
import matplotlib.pyplot as plt
from sklearn import datasets

boston = datasets.load_boston()

X_bar = boston.data[:, np.newaxis, 5]
y_bar = boston.target

#plt.scatter(X_bar, y_bar)
#plt.show()

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X_bar, y_bar, test_size=0.2)

from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(random_state = 0)
regressor.fit(X_train, y_train)

#Predecir un nuevo resultado
regressor.predict(X_test)

#Visualización de los resultados
X_grid = np.arange(min(X_test), max(X_test), 0.1)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X_test, y_test)
plt.plot(X_grid, regressor.predict(X_grid), color='red', linewidth=3)
plt.show()

print('Precisión del modelo:')
print(regressor.score(X_train, y_train))