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

### Current result
Unfortunately, for now I have tested algorithms' work only on the training data
set, but I'm looking forward to getting bigger data set which I could split in a
appropriate way.

In the table below is represented accuracy of each algorithm.

| Algorithm | Signal | Fourier |
| --------- | -----: | ------: |
| MD (Mahalanobis) | 67.22% | 86.11% |
| MD (Euclidean) | 73.89% | 84.44% |
| Neural network | 77.78% | 93.33% |
| Naive Bayes | 92.78% | 97.22% |

Accuracy for different feature sets:

| Algorithm | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14|
| --------- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| MD (Euclidean) | 72.22 | 71.67 | 71.11 | 72.78 | 70.00 | 80.56 | 85.00 | 84.44 | 80.56 | 86.11 | 85.56 | 83.89 | 72.22 | 86.11 |
| MD (Mahalanobis) | 61.11 | 58.33 | 59.44 | 51.11 | 61.11 | 70.00 | 80.00 | 69.44 | 75.56 | 76.67 | 84.44 | 76.67 | 64.44 | 86.11 |
| K-Means | 61.67 | 64.44 | 64.44 | 60.00 | 62.22 | 73.89 | 75.00 | 75.00 | 73.89 | 75.56 | 76.11 | 75.00 | 58.33 | 75.00 |
| Naive Bayes | 100.00 | 100.00 | 100.00 | 100.00 | 98.89 | 98.89 | 98.89 | 99.44 | 82.78 | 100.00 | 100.00 | 82.78 | 72.78 | 100.00 |
| Neural network | 75.56 | 84.44 | 83.89 | 86.67 | 79.44 | 93.33 | 93.89 | 92.22 | 93.89 | 93.33 | 93.33 | 93.89 | 75.00 | 93.33 |