import numpy as np
import matplotlib.pyplot as plt 
import pandas as pd

dataset = pd.read_csv("dataset.csv")

X = dataset.iloc[:,2:14].values
y = dataset.iloc[:,15].values

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y,test_size= 0.2, random_state=0)

from sklearn.preprocessing import StandardScaler
sc_x = StandardScaler()
X_train = sc_x.fit_transform(X_train)
X_test = sc_x.transform(X_test)

from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA
lda = LDA(n_components=1)
X_train = lda.fit_transform(X_train,y_train)
X_test = lda.transform(X_test)
