function acc = accuracy(Theta1, Theta2, X, y)

m = size(X, 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[useless, p] = max(h2, [], 2);

acc = mean(double(p == y)) * 100;

end
