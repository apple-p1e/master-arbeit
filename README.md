# Master Arbeit

### General information

Actually, this is my sandbox where I am trying to do my master thesis with the
topic "Development of a classification system for the identification of vehicle
classes". For now, I have implemented the following algorithms:

* Minimum distance
* K-Means
* Naive Bayes
* Neural network

Each classifier represents an Octave's class with two common methods:

* `classifier = train(classifier, X, y)`
* `labels = predict(classifier, X)`

Besides that, there are many common function, which I placed in the
corresponding folder, thus add this folder to the path with the command
`addpath('path_to_folder')` at first.

Also there is a `runDemonstation.m` script that asks you to choose a
classifier, then trains and makes the prediction on the same data set, prints
evaluation, and asks whether to plot 3D scatter (it projects data to 3D
with PCA algorithm). You only need to specify a file with *X* and *y* to load.