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