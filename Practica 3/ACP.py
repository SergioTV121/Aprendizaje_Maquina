import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


dataset=pd.read_csv("dataset.csv")

X=dataset.iloc[:,2:14].values
y=dataset.iloc[:,15].values

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test=train_test_split(X,y,test_size=0.2,random_state=0)

from sklearn.preprocessing import StandardScaler
sc_X=StandardScaler()
X_train=sc_X.fit_transform(X_train)
X_test=sc_X.transform(X_test)

#Reduccion con ACP

from sklearn.decomposition import PCA

pca=PCA(n_components=2)
X_train=pca.fit_transform(X_train)
X_test=pca.transform(X_test)

varianza_explicada=pca.explained_variance_ratio_


plt.scatter(X_train[:,0],X_train[:,1])
plt.title("Dispersion")
plt.xlabel("PC1")
plt.ylabel("PC2")


