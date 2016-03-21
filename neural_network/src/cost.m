function [J gradient] = cost( param, ...
                              input_layer_size, ...
                              hidden_layer_size, ...
                              output_layer_size, ...
                              X, y, lambda)

% Get back original values of Theta1 and Theta2 (reshape parameters)
Theta1 = reshape(param(1:hidden_layer_size * (input_layer_size + 1)), ...
                  hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(param((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                  output_layer_size, (hidden_layer_size + 1));

m = size(X, 1);

% Feedforward pass (compute activations and the hypothesis)
a1 = [ones(m, 1) X];
z2 = a1 * Theta1';
a2 = [ones(size(z2), 1) sigmoid(z2)];
z3 = a2 * Theta2';
a3 = sigmoid(z3);
h = a3;

% We want the output y variable to be a logical array (a vector) where : 
% If the training example belongs to the class k, y_k = 1 and otherwise y_k = 0
y_vect = zeros(m, output_layer_size);
I = eye(output_layer_size);
for i=1:m
   y_vect(i,:) = I(y(i),:);
end

sum_theta1 = sum(sum(Theta1(:,2:end) .^ 2), 2);
sum_theta2 = sum(sum(Theta2(:,2:end) .^ 2), 2);
reg = (lambda / (2 * m)) * (sum_theta1 + sum_theta2);

J = (1 / m) * sum(sum((-y_vect) .* log(h) - (1 - y_vect) .* log(1 - h), 2)) + reg;

% Backpropagation to compute gradient
d3 = a3 - y_vect;
d2 = d3 * Theta2 .* sigmoid_gradient([ones(size(z2, 1), 1) z2]);
d2 = d2(:,2:end);

D1 = d2' * a1;
D2 = d3' * a2;

% Don't want to regularize the first column of Thetas (because it's the bias)
Theta1_reg = [zeros(size(Theta1, 1), 1) Theta1(:,2:end)];
Theta2_reg = [zeros(size(Theta2, 1), 1) Theta2(:,2:end)];

Theta1_grad = (1 / m) * D1 + (lambda / m) * Theta1_reg;
Theta2_grad = (1 / m) * D2 + (lambda / m) * Theta2_reg;

% Unroll gradients
gradient = [Theta1_grad(:) ; Theta2_grad(:)];

end
