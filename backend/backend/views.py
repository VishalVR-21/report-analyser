from django.shortcuts import render
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

def home(request):
    return render(request,"home.html")

def predict(request):
    return render(request,"predict.html")
def result(request):
    df = pd.read_csv('/home/linuxlite/Desktop/ml/diabates/static/diabetes.csv')
    X= df.drop("Outcome",axis =1)
    Y = df["Outcome"]
    X_train,X_test,y_train,y_test = train_test_split(X,Y,test_size=0.1)
    log = LogisticRegression()
    log.fit(X_train,y_train)
    va1 = float(request.GET['n1'])
    va2 = float(request.GET['n2'])
    va3 = float(request.GET['n3'])
    va4 = float(request.GET['n4'])
    va5 = float(request.GET['n5'])
    va6 = float(request.GET['n6'])
    va7 = float(request.GET['n7'])
    va8 = float(request.GET['n8'])
    predict = log.predict([[va1,va2,va3,va4,va5,va6,va7,va8]])

    result2=""
    if predict==[1]:
        result2="Postive"
    else:
        result2="Negative"

    return render(request,"predict.html",{'result2':result2}
