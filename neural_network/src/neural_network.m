clear;
close all;
clc;


% Step 1 : load data
fprintf('Loading data...\n');
load('data.mat');
% X = features, y = output, n = number of features, m = number of examples
m = size(X, 1);

% 20x20 input images
% 25 hidden units
% 10 labels (from 1 to 10, each corresponding to a digit with "0" = 10)
input_layer_size  = 400;
hidden_layer_size = 25;
output_layer_size = 10;

fprintf('Pause. Press ENTER to continue...\n');
pause;


% Step 2 : training neural network
fprintf('Training neural network...\n');

options = optimset('MaxIter', 50);

% Generate random thetas values
initial_Theta1 = rand_init_weights(input_layer_size, hidden_layer_size);
initial_Theta2 = rand_init_weights(hidden_layer_size, output_layer_size);
% Unroll parameters
initial_param = [initial_Theta1(:) ; initial_Theta2(:)];

lambda = 1;
cost_func = @(p) cost(  p, ...
                        input_layer_size, ...
                        hidden_layer_size, ...
                        output_layer_size, ...
                        X, y, lambda);
[param, cost] = fmincg(cost_func, initial_param, options);

% Get back original values of Theta1 and Theta2 (reshape parameters)
Theta1 = reshape(param(1:hidden_layer_size * (input_layer_size + 1)), ...
                  hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(param((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                  output_layer_size, (hidden_layer_size + 1));


% Step 3 : print accuracy obtained by our neural network
fprintf('Training accuracy : %f\n', accuracy(Theta1, Theta2, X, y));
