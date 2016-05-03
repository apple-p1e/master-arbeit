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
classifier, then trains and makes the prediction on the same data set,
prints evaluation, and asks whether to plot 3D scatter (it projects data to
3D with PCA algorithm). You only need to specify a file with X and y to load.

Report is written in LaTeX (in progress).

### Current result

There was made an attempt to define the best feature set for classification.
Evaluation is represented as accuracy, in %.

1. XMAX, XMIN, XSPA, XGRW, XEFF, FFAK
2. XGRW, XMAX, XMIN, XSPA, XEFF, FFAK, GAM1 signal, GAM2 signal
3. XGRW, XMAX, XMIN, XSPA, XEFF, FFAK, MOM2, MOM3, MOM4, GAM1 signal, GAM2 signal
4. XGRW, XMAX, XMIN, XSPA, XEFF, FFAK, Positive Hills, Negative Hills
5. GAM1 signal, GAM2 signal, Positive Hills, Negative Hills
6. GAM1 signal, GAM2 Fourier, Positive Hills, Negative Hills
7. GAM1 Fourier, GAM2 Fourier, Positive Hills, Negative Hills
8. GAM1 Fourier, GAM2 Fourier, Positive Hills, Negative Hills, XSPA
9. GAM2 Fourier, Positive Hills, Negative Hills
10. GAM1 Fourier, GAM2 Fourier, Positive Hills
11. GAM1 Fourier, GAM2 Fourier, Negative Hills
12. GAM1 Fourier, Positive Hills, Negative Hills
13. Positive Hills, Negative Hills
14. GAM1 Fourier, GAM2 Fourier

| Algorithm | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14|
| --------- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| MD (Euclidean) | 72.22 | 71.67 | 71.11 | 72.78 | 70.00 | 80.56 | 85.00 | 84.44 | 80.56 | 86.11 | 85.56 | 83.89 | 72.22 | 86.11 |
| MD (Mahalanobis) | 61.11 | 58.33 | 59.44 | 51.11 | 61.11 | 70.00 | 80.00 | 69.44 | 75.56 | 76.67 | 84.44 | 76.67 | 64.44 | 86.11 |
| K-Means | 61.67 | 64.44 | 64.44 | 60.00 | 62.22 | 73.89 | 75.00 | 75.00 | 73.89 | 75.56 | 76.11 | 75.00 | 58.33 | 75.00 |
| Naive Bayes | 100.00 | 100.00 | 100.00 | 100.00 | 98.89 | 98.89 | 98.89 | 99.44 | 82.78 | 100.00 | 100.00 | 82.78 | 72.78 | 100.00 |
| Neural network | 75.56 | 84.44 | 83.89 | 86.67 | 79.44 | 93.33 | 93.89 | 92.22 | 93.89 | 93.33 | 93.33 | 93.89 | 75.00 | 93.33 |

![Features comparison](https://raw.githubusercontent.com/apple-p1e/master-arbeit/master/images/merkmalsvergleich.png)

**As a result**, the 7th feature set was chosen. Further this set is used.

##### Minimum distance (Euclidean metric)

|       | Cars | Trucks |
| ----: | ---: | -----: |
| True  | 90 | 63 |
| False | 27 | 0 |

![Euclidean metric](https://raw.githubusercontent.com/apple-p1e/master-arbeit/master/images/3dEuclid.png)

##### Minimum distance (Mahalanobis distance)

|       | Cars | Trucks |
| ----: | ---: | -----: |
| True  | 84 | 60 |
| False | 30 | 6 |

![Mahalanobis distance](https://raw.githubusercontent.com/apple-p1e/master-arbeit/master/images/3dMahalanobis.png)

##### K-Means

|       | Cars | Trucks |
| ----: | ---: | -----: |
| True  | 84 | 60 |
| False | 30 | 6 |

![K Means](https://raw.githubusercontent.com/apple-p1e/master-arbeit/master/images/3dKMeans.png)

##### Naive Bayes

|       | Cars | Trucks |
| ----: | ---: | -----: |
| True  | 88 | 90 |
| False | 0 | 2 |

![Naive Bayes](https://raw.githubusercontent.com/apple-p1e/master-arbeit/master/images/3dNaiveBayes.png)

##### Neural network

|       | Cars | Trucks |
| ----: | ---: | -----: |
| True  | 85 | 84 |
| False | 6 | 5 |

![Neural network](https://raw.githubusercontent.com/apple-p1e/master-arbeit/master/images/3dNeuralNetwork.png)