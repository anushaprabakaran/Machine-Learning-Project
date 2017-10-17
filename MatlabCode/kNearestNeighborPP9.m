%k-Nearest Neighbor classifier on the initial pre-processed data

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

%k-Nearest Neighbor
tic;                              % start training time
kNN = fitcknn(trainingSet, trainingLabel);
toc;                              % end training time

%Predict the test labels
predictLabelKNN = predict(kNN, testSet);

%Confusion Matrix of kNN
confusionMatrixKNN = confusionmat(testLabel, predictLabelKNN);  
display(confusionMatrixKNN); 

%Plot Confusion Matrix of kNN
[n,p] = size(testSet);
isLabels = unique(testLabel);
nLabels = numel(isLabels);
[~,grpOutput2] = ismember(predictLabelKNN, isLabels); 
outputMat = zeros(nLabels,n); 
idxLinear = sub2ind([nLabels n],grpOutput2,(1:n)'); 
outputMat(idxLinear) = 1;  
[~,grpLabel] = ismember(testLabel,isLabels); 
labelMat = zeros(nLabels,n); 
idxLinearY = sub2ind([nLabels n],grpLabel,(1:n)'); 
labelMat(idxLinearY) = 1;
plotconfusion(labelMat,outputMat);

%Accuracy of kNN
accuracyKNN = sum(diag(confusionMatrixKNN))/sum(confusionMatrixKNN (:));   
fprintf('\n The accuracy for K-Nearest Neighbor Model is %0.4f\n', accuracyKNN);

%Resub
resuberrorKNN = resubLoss(kNN);
fprintf('\n The resuberror for K-Nearest Neighbor Model is %0.4f\n', resuberrorKNN);

%Cross Validation
cvKNN = crossval(kNN, 'KFold', 10);
cvLossKNN = kfoldLoss(cvKNN);
fprintf('\n The cvLoss for K-Nearest Neighbor Model is %0.4f\n', cvLossKNN);
