# Multi-Label-Support-Vector-Machine
This repository contains mat lab code to train SVM on multi label data and test on test data.
I have used MATLAB’s importdata function to load X_test, X_train, Y_test and Y_train. I have used binary Support machine Classifier model to train multi label data using one versus all approach. There are totally 6 classes in the given data set. So we have trained 6 SVM models. In this case each sample belongs to 1 or more number of classes. fitcsvm is used to train these 6 SVM models. This function takes X_train, Y_train in vector form, Kernel function (Polynomial in this case) and polynomial order (which is 2).  While training each model ‘k’ we pass each samples value for kth class (either 0 or 1). All 6 models are tested against X_Test with the help of Predict function. This function will return value for each sample for each class. 
Accuracy is calculated using below method:
Let Pi be the vector representing label for ith sample (predicted). This vector will have 6 values with one or more 1 value.  Oi be the vector representing label for ith sample (Given Y_test). This vector will also have 6 values with one or more 1 value.  Value of i=1 to 907 (Since there are 907 samples in the test data).
We then calculate Accuracy for each sample as using following formulae:
Ai = |Pi∩Oi | / | PiUOi |

|Pi∩Oi | = Number of 1’s in the intersection of Pi and Oi. Values in the interaction will be 1 only if corresponding values in both Pi and Oi is 1 otherwise 0.
| PiUOi |= Number of 1’s in the union of Pi and Oi. Values in the union will be 0 if corresponding values in both Pi and Oi is 0 otherwise 1.
Final accuracy is calculated as the average accuracy of all the classes.  

X_train: Attributes of training data Y_train: Label of thr training data X_test: Attributes of testing data Y_test: Label of thr testing data I haven't uploaded these files since they are big. You can try this code for your own data set. Number of model to be trained depends on number of class.
