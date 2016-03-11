clear;
close all;
clc;


% Step 1 : load data
fprintf('Loading data...\n');
data = load('data.txt');
% X = features, y = output, n = number of features, m = number of examples
X = data(:, 1:2);
y = data(:, 3);
n = size(X, 2);
m = size(X, 1);

fprintf('Loaded %d features with %d examples.\n', size(X, 2), size(X, 1));
fprintf('Loaded %d output examples.\n', size(y, 1));

fprintf('Pause. Press ENTER to continue...\n');
pause;


% Step 2 : normalize data
fprintf('Normalizing features...\n');
[X mu sigma] = feature_normalize(X);
% Add intercept term to X
X = [ones(m, 1) X];
n = n + 1;


% Step 3 : gradient descent algorithm
fprintf('Running gradient descent...\n');
% alpha is the learning rate of our algorithm
alpha = 0.01;
nb_iter = 400;
% theta is the coefficients of our hypothesis linear function
theta = zeros(n, 1);
[theta, J_values] = gradient_descent(X, y, theta, alpha, nb_iter);
fprintf('Theta values :\n');
fprintf('\t%f\n', theta);


% Step 4 : plot results
figure;
plot(1:numel(J_values), J_values, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
