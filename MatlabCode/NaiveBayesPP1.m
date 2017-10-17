%Naive Bayes classifier on the initial pre-processed data

%Load Data 
load('DataPreProcessed1.mat');

%Labels
%Training set
trainingSet = AdultDataTrainFinal(:,1:10);
%Separating the last label column from training set
trainingLabel = AdultDataTrainFinal(:,11:11);
%Test set
testSet = AdultDataTestFinal(:,1:10); 
%Separating the last label column from test set
testLabel = AdultDataTestFinal(:,11:11);

%Naïve Bayes
tic;                          % start training time
naiveBayes = fitcnb(trainingSet, trainingLabel);
toc;                          % end training time

%Predict the test labels
predictLabelNB = predict(naiveBayes, testSet);

%Confusion Matrix of Naïve Bayes
confusionMatrixNB = confusionmat(testLabel, predictLabelNB);   
display(confusionMatrixNB);

%Plot Confusion Matrix of Naïve Bayes
[n,p] = size(testSet);
isLabels = unique(testLabel);
nLabels = numel(isLabels);
[~,grpOutput3] = ismember(predictLabelNB, isLabels); 
outputMat = zeros(nLabels,n); 
idxLinear = sub2ind([nLabels n],grpOutput3,(1:n)'); 
outputMat(idxLinear) = 1;  
[~,grpLabel] = ismember(testLabel,isLabels); 
labelMat = zeros(nLabels,n); 
idxLinearY = sub2ind([nLabels n],grpLabel,(1:n)'); 
labelMat(idxLinearY) = 1;
plotconfusion(labelMat,outputMat);

%Accuracy of Naïve Bayes
accuracyNB = sum(diag(confusionMatrixNB))/sum(confusionMatrixNB (:));   
fprintf('\n The accuracy for Naïve Bayes Model is %0.4f\n', accuracyNB);

%Resub
resuberrorNB = resubLoss(naiveBayes);
fprintf('\n The resuberror for Naïve Bayes Model is %0.4f\n', resuberrorNB);

%Cross Validation
cvNB = crossval(naiveBayes, 'KFold', 10);
cvLossNB = kfoldLoss(cvNB);
fprintf('\n The cvLoss for Naïve Bayes Model is %0.4f\n', cvLossNB);

