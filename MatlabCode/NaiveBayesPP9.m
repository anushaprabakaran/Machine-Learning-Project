%Naive Bayes classifier on the initial pre-processed data

%Load Data 
load('DataPreProcessed9.mat');

%Labels
%Training set
trainingSet = AdultDataTrainFinal9AgeEdu(:,1:2);
%Separating the last label column from training set
trainingLabel = AdultDataTrainFinal9AgeEdu(:,3:3);
%Test set
testSet = AdultDataTestFinal9AgeEdu(:,1:2); 
%Separating the last label column from test set
testLabel = AdultDataTestFinal9AgeEdu(:,3:3);

%Na�ve Bayes
tic;                          % start training time
naiveBayes = fitcnb(trainingSet, trainingLabel);
toc;                          % end training time

%Predict the test labels
predictLabelNB = predict(naiveBayes, testSet);

%Confusion Matrix of Na�ve Bayes
confusionMatrixNB = confusionmat(testLabel, predictLabelNB);   
display(confusionMatrixNB);

%Plot Confusion Matrix of Na�ve Bayes
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

%Accuracy of Na�ve Bayes
accuracyNB = sum(diag(confusionMatrixNB))/sum(confusionMatrixNB (:));   
fprintf('\n The accuracy for Na�ve Bayes Model is %0.4f\n', accuracyNB);

%Resub
resuberrorNB = resubLoss(naiveBayes);
fprintf('\n The resuberror for Na�ve Bayes Model is %0.4f\n', resuberrorNB);

%Cross Validation
cvNB = crossval(naiveBayes, 'KFold', 10);
cvLossNB = kfoldLoss(cvNB);
fprintf('\n The cvLoss for Na�ve Bayes Model is %0.4f\n', cvLossNB);

