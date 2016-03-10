function [theta, J_values] = gradient_descent(X, y, theta, alpha, nb_iter)

m = length(y);
J_values = zeros(nb_iter, 1);

for i = 1:nb_iter
   theta = theta - (alpha / m) * X' * (X * theta - y);
   % Save the J value to plot the variations later
   J_values(i) = cost(X, y, theta);
end

end
