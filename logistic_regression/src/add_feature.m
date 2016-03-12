function features = add_feature(X1, X2)

features = ones(size(X1(:,1)));
degree = 6;
for i = 1:degree
   for j = 0:i
      features(:, end+1) = (X1 .^ (i - j)) .* (X2 .^ j);
   end
end

end
