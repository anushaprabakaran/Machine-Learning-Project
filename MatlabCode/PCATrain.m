 %PCA Training Data set: Marital Status and Relationship
 
 %Load Data
 load('PCATrainData.mat');
 
 %Marital Status
 x = AdultDataTrainMS(:,1:1);
 %Relationship
 y = AdultDataTrainRela(:,1:1);
 
 %PCA
 A = horzcat(x,y);
 eigenVector = pca(A);
 principalComponent = A * eigenVector(:,1:1);
 
 %Reconstruct data
 reconstructedData = principalComponent * transpose(eigenVector(:,1:1));
