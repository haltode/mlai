% Squared error function
function J = cost(X, y, theta)

m = length(y);

diff = (X * theta - y) .^ 2;
J = (1 / (2 * m)) * sum(diff);

end
