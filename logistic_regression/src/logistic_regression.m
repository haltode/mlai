clear;
close all;
clc;


% Step 1 : load data
fprintf('Loading data...\n');
data = load('data.txt');
data_size = size(data, 2);
% X = features, y = output, n = number of features, m = number of examples
X = data(:, 1:data_size - 1);
y = data(:, data_size);
n = size(X, 2);
m = size(X, 1);

fprintf('Loaded %d features with %d examples.\n', n, m);
fprintf('Loaded %d output examples.\n', size(y, 1));

fprintf('Pause. Press ENTER to continue...\n');
pause;


% Step 2 : add polynomial features (in case the data are not linearly separable)
% In our case we have 2 features, X1 and X2 and we would like to add :
% X1 ^ 2, X2 ^ 2, X1 * X2, X1 * X2 ^ 2, etc.
fprintf('Adding features...\n');
X1 = X(:,1);
X2 = X(:,2);
X = add_feature(X1, X2);
n = size(X, 2);


% Step 3 : use optimized built-in algorithm to find thetas
fprintf('Optimizing thetas...\n');
init_theta = zeros(n, 1);
lambda = 1;
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, J, exit_flag] = ...
   fminunc(@(t)(cost(t, X, y, lambda)), init_theta, options);


% Step 4 : plot decision boundary and print accuracy
plot_decision_boundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')
legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

fprintf('Training accuracy : %f\n', accuracy(theta, X, y));
