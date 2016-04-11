# Master Arbeit

Actually, this is my sandbox where I am trying to do my master thesis. 
I am playing with machine learning in Octave and have implemented the
following classifiers:
* Minimum distance
* Naive Bayes
* Neural network

Each classifier has own train and predict functions. There are also
run-scripts to run a classifier, but before you do this you need to
specify couple of things:
* `load('filename')` to load train/test data sets. It is supposed that
data set is represented by a matrix of features X \[m × 4\] and corresponding
vector of class labels y \[m × 1\].
* `addpath('path_to_data_folder')` because data folder includes functions to
evaluate and print result of prediction. These functions are common for every
classifier, so it seems like OOP paradigm fits well here, but when I started
to implement this, I realized it is not worth it.

And also I am writing here my master thesis report in LaTeX.