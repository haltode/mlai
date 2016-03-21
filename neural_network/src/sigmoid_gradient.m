function g = sigmoid_gradient(z)

sig = sigmoid(z);
g = sig  .* (1 - sig);

end
