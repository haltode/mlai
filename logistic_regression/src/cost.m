function [J, gradient] = cost(theta, X, y, lambda)

m = length(y);
gradient = zeros(size(theta));

h = sigmoid(X * theta);

reg = (lambda / (2 * m)) * sum(theta(2:end) .^ 2);
J = (1 / m) * sum(-y .* log(h) - (1 .- y) .* log(1 .- h)) + reg;

% theta0 remains unchanged with regularization, but theta0 is actually theta(1)
gradient(1) = (1 / m) * sum((h - y) .* X(:,1));
for j = 2:length(theta)
   gradient(j) = ((1 / m) * sum((h - y) .* X(:,j))) + (lambda / m) .* theta(j);
end

end
