%ROC for PCA

load('ROCData2.mat');
load('DataPreProcessed7PCA.mat');

trainingSet = AdultDataTrainFinal7PCA(:,1:4);
testSet = AdultDataTestFinal7PCA(:,1:4); 

respTrain = strcmp(trainbglabelROC2,'b');
respTest = strcmp(testbglabelROC2,'b');

%Decision Tree
decisionTree = fitctree(trainingSet, respTrain);
[~,score_tree] = resubPredict(decisionTree);
[Xtree,Ytree,Ttree,AUCtree] = perfcurve(respTrain,score_tree(:,decisionTree.ClassNames),'true');
plot(Xtree,Ytree);

%k-Nearest Neighbor
kNearestNeighbor = fitcknn(trainingSet, respTrain);
[~,score_knn] = resubPredict(kNearestNeighbor);
[Xknn,Yknn,Tknn,AUCknn] = perfcurve(respTrain,score_knn(:,kNearestNeighbor.ClassNames),'true');

%Naive Bayes
naiveBayes = fitcnb(trainingSet, respTrain);
[~,score_nb] = resubPredict(naiveBayes);
[Xnb,Ynb,Tnb,AUCnb] = perfcurve(respTrain,score_nb(:,naiveBayes.ClassNames),'true');
plot(Xnb,Ynb);

%Plotting the ROC 
plot(Xtree,Ytree)
hold on
plot(Xknn,Yknn)
plot(Xnb,Ynb)
legend('Decision Tree','k-Nearest Neighbor','Naive Bayes','Location','Best')
xlabel('False positive rate');
ylabel('True positive rate');
title('ROC Curves for DecisionTree, kNN, and Naive Bayes Classification')
hold off
