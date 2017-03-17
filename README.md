# BoostingMultinomialLogit

This Boosting algorithm consists of iteratively learning weak classifiers based on a weight and adding them to a final strong classifier.
Here the boosting was used to enhance the logistic regression.
In a way that the whole data was divided to two datasets, training/test which is used as the input (70% of the data) and validation (30% of the data). 
In the first iteration, 50% of the data was chosen randomly with the same weight and a logistic regression is developed and the performance of it was calculated on the whole input dataset. 
From the next iteration, sample of training data (50% of data) were chosen randomly based on some assigned weights, in fact, procedure trains the classifiers by giving higher weights to those training sets that were misclassified.
In other word, the result of each iteration classification is used to give higher weights to misclassified data and concentrate more on misclassified data. 
Finally, all the classifiers used were voted according to their accuracy and that final classification model became a weighted vote of all the.
The validation is done by estimating the accuracy of final model on the 30% of data which are never used in the training. 
