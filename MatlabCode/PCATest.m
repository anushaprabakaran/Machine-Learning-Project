 %PCA Test Data set: Marital Status and Relationship
 
 %Load Data
 load('PCATestData.mat');
 
 %Marital Status
 x = AdultDataTestMS(:,1:1);
 %Relationship
 y = AdultDataTestRela(:,1:1);
 
 %PCA
 A = horzcat(x,y);
 eigenVector = pca(A);
 principalComponent = A * eigenVector(:,1:1);
 
 %Reconstruct data
 reconstructedData = principalComponent * transpose(eigenVector(:,1:1));