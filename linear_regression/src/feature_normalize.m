% Make sure features are on a similar scale to accelerate gradient descent
function [X_normalized, mu, sigma] = feature_normalize(X)

mu = mean(X);
sigma = std(X);
X_normalized = (X .- mu) ./ sigma;

end
