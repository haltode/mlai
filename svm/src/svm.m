clear;
close all;
clc;


% Step 1 : load data
fprintf('Loading data...\n');
load('data.mat');

fprintf('Pause. Press ENTER to continue...\n');
pause;


% Step 2 : automatically select SVM parameters
fprintf('Selecting best SVM parameters...\n');

[C, sigma] = select_params(X, y, Xval, yval);
fprintf('C : %f\n', C);
fprintf('sigma : %f\n', sigma);


% Step 3 : training SVM with gaussian kernel
fprintf('Training SVM (with gaussian kernel)...\n');

model = svmTrain(X, y, C, @(x1, x2) gaussian_kernel(x1, x2, sigma));


% Step 4 : visualize the boundary chosen by SVM
visualizeBoundary(X, y, model);
