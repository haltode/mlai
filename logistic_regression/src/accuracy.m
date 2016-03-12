function acc = accuracy(theta, X, y)

m = size(X, 1);
p = zeros(m, 1);

for i = 1:m
   prob = sigmoid(X(i,:) * theta);
   if prob >= 0.5
      p(i) = 1;
   endif
end

acc = mean(double(p == y)) * 100;

end
