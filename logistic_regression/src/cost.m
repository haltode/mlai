function [J, gradient] = cost(theta, X, y, lambda)

m = length(y);
gradient = zeros(size(theta));

h = sigmoid(X * theta);

% theta0 remains unchanged with regularization, but theta0 is actually theta(1)
tempT = theta;
tempT(1) = 0;

reg = (lambda / (2 * m)) * tempT' * tempT;
J = (1 / m) * (-y' * log(h) - (1 - y)' * log(1 - h)) + reg;

reg = (lambda / m) * tempT;
gradient = (1 / m) * (X' * (h - y)) + reg;

end
