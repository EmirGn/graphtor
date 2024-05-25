import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

dataframe = pd.read_csv("./datesValues.csv", header = None)
x = [x for x in range(len(dataframe[1]))]
y = dataframe[1]

plt.scatter(x, y)

plt.savefig("plot.png")